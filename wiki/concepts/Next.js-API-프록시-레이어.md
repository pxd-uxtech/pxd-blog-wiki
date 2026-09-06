---
type: concept
domain: "웹 개발"
name: "Next.js API 프록시 레이어"
sources: ["/1889"]
updated: "2026-09-07"
---
# Next.js API 프록시 레이어

**API 프록시 레이어**는 Next.js **App Router**의 **API Routes**를 프론트엔드와 백엔드 사이에 두어, 클라이언트가 백엔드를 직접 호출하지 않고 항상 같은 출처(same-origin)의 `/api/...` 경로로만 요청하도록 만드는 구조다. pxd가 GEONIQ(SEO/GEO 분석 서비스) 개발 과정에서 이 구조를 도입했는데, 프론트엔드는 Next.js App Router, 백엔드는 FastAPI로 나뉘어 있어 프론트엔드에서 백엔드 API를 직접 호출하는 단순한 구조로 시작했지만 개발이 진행되며 세 가지 문제에 부딪혀 자연스럽게 프록시 레이어가 필요해졌다.

첫 번째 문제는 **CORS**다. 프론트엔드(`localhost:3000`)가 백엔드(`localhost:8001`)를 직접 호출하면 CORS 설정이 필요하고, 개발·스테이징·프로덕션 등 환경이 늘어날 때마다 양쪽 설정을 맞춰야 하는 번거로움이 생긴다. 두 번째 문제는 **백엔드 URL이 환경마다 다르다**는 점이다. 클라이언트에서 직접 호출하면 백엔드 URL이 브라우저에 그대로 노출되는데, 관리자 API 주소가 외부에 드러나는 것은 보안상 바람직하지 않다. 서버 사이드(API Route)에서 환경변수로 URL을 결정하면 이 문제가 함께 해결된다. 세 번째 문제는 **인증 토큰 관리**다. Google OAuth로 로그인해 받은 JWT 토큰을 어디에 저장할지가 관건인데, `localStorage`는 XSS에 취약하고 일반 쿠키는 JavaScript에서 읽을 수 있다. 결국 **httpOnly 쿠키**를 사용하게 됐고, 이 쿠키는 브라우저 JavaScript에서 읽을 수 없으므로 서버에서 꺼내 백엔드로 전달하는 중간 레이어가 프록시 레이어가 필요한 가장 직접적인 이유가 됐다.

구현은 `app/api/[...path]/route.ts`의 **catch-all 프록시 라우트** 하나로 일반적인 호출을 처리하고, `auth/set-tokens`·`auth/refresh`·`auth/me`·`auth/logout` 같은 보안이 필요한 라우트만 개별 파일로 분리하는 패턴을 쓴다. catch-all 프록시 함수는 요청 쿠키에서 `access_token`을 꺼내고, 없으면 401을 반환하며, 있으면 요청 경로 앞에 백엔드 API 경로(`/admin/...`)를 붙여 URL을 조합하고 `Authorization: Bearer` 헤더에 토큰을 실어 백엔드로 전달한 뒤 응답을 그대로 클라이언트에 돌려준다. GET/POST 등 모든 HTTP 메서드가 동일한 `proxyRequest` 함수를 재사용하도록 구성한다.

이 구조가 만드는 실질적 이점은 두 가지다. 첫째, **클라이언트 코드가 단순해진다.** 클라이언트는 백엔드 URL도, 토큰 관리도 신경 쓸 필요 없이 `credentials: "include"` 옵션으로 `/api/...`만 호출하면 되고, 새 기능이 추가돼도 클라이언트에서 새 엔드포인트를 호출하는 함수만 추가하면 프록시 쪽은 건드릴 필요가 없다. 둘째, **OAuth 콜백 흐름이 명확해진다.** 사용자가 로그인하면 백엔드가 OAuth를 처리한 뒤 프론트엔드로 리다이렉트하며 URL 파라미터에 토큰을 담아 전달하는데(`/auth/callback/google?access_token=xxx&refresh_token=yyy`), 콜백 페이지가 즉시 `/test-api/test-auth/tokens`를 호출해 httpOnly 쿠키에 토큰을 저장하면 토큰은 URL에서 곧바로 사라지고, 이후 모든 요청은 쿠키가 자동 전송돼 클라이언트 코드에서 토큰을 직접 다룰 일이 없어진다.

이 프록시 레이어는 처음부터 "좋은 아키텍처를 설계하겠다"는 의도보다 CORS·보안 같은 실무 문제를 풀기 위해 자연스럽게 만들어진 결과물이었다는 점이 강조된다. Next.js App Router를 쓴다면 API Routes가 단순한 서버리스 함수가 아니라 프론트엔드와 백엔드 사이의 유용한 중간 레이어(BFF, Backend for Frontend에 가까운 역할)가 될 수 있다는 것이 핵심 시사점이다.

## 핵심 내용
- Next.js App Router의 API Routes를 프론트엔드-백엔드 사이 **프록시 레이어**로 활용
- 도입 이유 3가지: **CORS** 설정 반복 회피, **백엔드 URL 비노출**(보안), **httpOnly 쿠키** 기반 인증 토큰 관리
- 구현 패턴: `app/api/[...path]/route.ts` catch-all 프록시 + 보안 필요 라우트(`auth/*`)만 개별 분리
- catch-all 프록시 흐름: 쿠키에서 토큰 추출 → 없으면 401 → 있으면 백엔드 URL 조합 후 `Authorization: Bearer` 헤더로 전달 → 응답 그대로 반환
- 클라이언트는 백엔드 URL·토큰을 몰라도 됨 — `credentials: "include"`로 `/api/...`만 호출
- **OAuth 콜백**: URL 파라미터로 잠깐 노출된 토큰을 콜백 페이지가 즉시 httpOnly 쿠키에 저장 → 이후 요청은 쿠키 자동 전송
- 프록시 레이어는 설계 의도보다 CORS·보안 문제 해결 과정에서 자연스럽게 형성된 BFF(Backend for Frontend)에 가까운 구조

## 관련 개념
- [[JWT 인증과 인가]] — 액세스·리프레시 토큰 구조와 페이로드 특성 등 이 프록시 레이어가 다루는 토큰의 기반 이론
- [[Next.js 레이아웃과 템플릿]] — 같은 Next.js App Router 생태계의 다른 아키텍처 패턴(레이아웃 캐싱, 인터셉트 라우트)
- [[GEONIQ 산업별 AI 검색 인사이트 리포트]] — 이 프록시 레이어가 실제로 적용된 서비스(GEONIQ)의 산출물 시리즈

## 출처
- [Next.js App Router에서 프록시 레이어를 둔 이유](https://story.pxd.co.kr/1889) — 2026-04-06, seonju.lee
