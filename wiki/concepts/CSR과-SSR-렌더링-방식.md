---
type: concept
domain: "웹 개발"
name: "CSR과 SSR 렌더링 방식"
sources: ["/1662"]
updated: "2026-09-07"
---
# CSR과 SSR 렌더링 방식

pxd UX Engineer는 사내 스터디에서 받은 "SSR이 왜 SEO에 유리한가"라는 질문에 곧바로 답하지 못한 경험을 계기로 **CSR(Client Side Rendering)**과 **SSR(Server Side Rendering)**의 차이를 정리했다. 두 렌더링 방식을 이해하려면 먼저 **SPA(Single Page Application)**와 **MPA(Multiple Page Application)**의 관계를 짚어야 한다. SPA는 하나의 페이지로 구성되어 데이터 수정·조회 시 화면을 동적으로 다시 그리며 새로고침이 발생하지 않아 CSR에 적합하지만, PHP·Java로 만든 정적 페이지 하나짜리 사이트도 SPA로 분류될 수 있어 SPA가 곧 CSR을 의미하지는 않는다. MPA는 여러 페이지로 구성되며 클라이언트 요청마다 서버가 렌더링해 응답하는 SSR 구조와 밀접하다.

**CSR**은 초기 로드 시 빈 HTML과 모든 로직이 담긴 JavaScript를 내려받은 뒤, 클라이언트에서 JavaScript로 DOM을 동적으로 생성해 화면을 그린다. 헤더·푸터 등 중복 요소는 그대로 두고 필요한 콘텐츠만 부분적으로 갱신할 수 있다는 장점이 있지만, 페이지별 정보가 담긴 완성된 HTML을 내려주지 않아 **SEO에 불리**하고(다만 최근 구글 봇은 CSR도 어느 정도 구분해낸다), 초기 진입 시 전체 JavaScript를 내려받아야 해 로딩이 길어진다는 단점이 있다. **SSR**은 반대로 서버에서 완성된 HTML을 렌더링해 내려주므로 각 페이지에 대한 정보를 담기 쉬워 SEO에 유리하고 초기 진입 속도가 CSR보다 빠르지만, 페이지 이동 시마다 헤더·푸터를 포함한 새 HTML 전체를 서버에서 다시 받아와 화면 깜빡임이 발생하고 이동 자체는 CSR보다 느리며, HTML이 JavaScript보다 먼저 도착하는 특성상 JavaScript 다운로드가 늦어지면 화면은 보여도 기능이 동작하지 않는 상태가 생길 수 있다.

CSR과 SSR은 양자택일이 아니라 함께 쓸 수 있다. pxd의 한 리팩토링 프로젝트는 **Nuxt**로 Vue 애플리케이션을 정적 페이지로 빌드해 서버에 배포함으로써 SEO를 확보했으며( [[Nuxt.js 프레임워크]] 참고), 이 밖에도 React+Gatsby, React+Next.js, Angular+Universal 조합이 CSR·SSR을 절충하는 대표적 방법으로 언급된다.

## 핵심 내용
- **SPA**: 단일 페이지, 동적 갱신, 새로고침 없음 — CSR에 적합하나 SPA=CSR은 아님(정적 페이지 SPA도 가능)
- **MPA**: 여러 페이지, 요청마다 서버 렌더링 — SSR과 밀접, 새로고침 발생
- **CSR 장점**: 부분 콘텐츠만 갱신 가능 / **단점**: 초기 JS 다운로드로 로딩 지연, SEO 취약
- **SSR 장점**: 완성된 HTML로 초기 진입 빠르고 SEO 유리 / **단점**: 페이지 이동 시 화면 깜빡임, 이동 속도는 CSR보다 느림, JS 지연 시 HTML은 보여도 기능 미동작 가능
- CSR·SSR은 병행 가능 — Nuxt(Vue), Next.js·Gatsby(React), Universal(Angular)이 대표적 절충 프레임워크

## 관련 개념
- [[브라우저 렌더링 파이프라인]] — HTML 파싱부터 픽셀 페인트까지 브라우저 내부 렌더링 단계
- [[코어 웹 바이탈과 SEO]] — SSR·CSR 선택이 LCP 등 초기 로딩 성능 지표에 미치는 영향
- [[Nuxt.js 프레임워크]] — CSR·SSR을 절충해 Vue 앱을 SEO 대응 가능하게 만드는 실제 구현 사례
- [[Next.js 레이아웃과 템플릿]] — React 진영에서 SSR·SSG를 지원하는 동일 목적의 프레임워크

## 출처
- [CSR과 SSR의 차이점](https://story.pxd.co.kr/1662) — 2023-02-23, 알 수 없는 사용자
