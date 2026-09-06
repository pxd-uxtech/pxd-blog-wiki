---
type: concept
domain: "웹 개발"
name: "React 서버 중심 렌더링 생태계 동향"
sources: ["/1902"]
updated: "2026-09-07"
---
# React 서버 중심 렌더링 생태계 동향

React 공식 블로그와 Next.js **App Router** 중심의 흐름을 보면, 최근 React 생태계는 **Server Components**, **Streaming UI**, **Server Actions**, **React Compiler** 같은 키워드로 대표되는 서버 중심 렌더링 구조를 공식으로 채택하는 방향으로 움직이고 있다. 이는 React 팀의 취향 변화라기보다, 서비스 규모가 커지면서 클라이언트가 처리할 JavaScript 양이 함께 늘고 번들 크기·hydration 비용·초기 렌더링 성능 문제가 누적된 데 대한 대응에 가깝다. React Query·SWR 같은 라이브러리로 클라이언트에서 데이터를 가져오는 방식은 캐싱·상태 관리에 강점이 있지만, 결국 브라우저에서 JavaScript가 실행된 이후 데이터를 요청하는 구조라 초기 사용자 경험 측면의 한계가 있었다.

**Server Components**는 이런 한계에 대응해, 데이터를 서버에서 먼저 가져오고 클라이언트에는 필요한 UI만 전달함으로써 클라이언트로 전달되는 JavaScript 양 자체를 줄인다. `useEffect` 기반 데이터 페칭이 "렌더링 이후 데이터를 가져오는 구조"였다면, `async function Page() { const data = await fetch(...); return <Component data={data} /> }` 형태의 서버 컴포넌트는 데이터가 준비된 상태로 렌더링을 시작한다. React 18에서 제시된 RSC 개념은 App Router를 거치며 React 19 이후 더 안정화되었고, 실무 적용 범위도 점진적으로 넓어지고 있다.

**Streaming UI**는 기존 SSR이 페이지에 필요한 HTML을 전부 생성한 뒤 한 번에 내려보내던 방식을, `Suspense` 경계를 기준으로 잘게 나눠 준비된 부분부터 먼저 전달하고 나머지는 점진적으로 이어 붙이는 방식으로 바꾼다. 페이지 전체가 준비되길 기다리지 않고 먼저 준비된 영역부터 사용자에게 보여줄 수 있어, 페이지 규모가 클수록 체감 이점이 커진다.

**React Compiler**는 `useMemo`·`useCallback`·`memo` 같은 메모이제이션 코드를 개발자가 직접 관리해야 했던 부담을 컴파일 단계에서 자동으로 처리한다. 직접 최적화 코드를 관리하는 방식은 개발자에게 제어권을 주지만 동시에 렌더링 최적화까지 고민해야 하는 복잡성을 낳았고, Vue·Svelte 같은 경쟁 프레임워크가 "React는 복잡하다"는 지점을 공략하며 성장한 배경과도 맞물린다. React Compiler는 2025년 10월 1.0 stable 버전이 릴리즈되며 점진적 도입이 제안되었다.

## 핵심 내용
- React 생태계 핵심 키워드: **Server Components**, **Streaming UI**, **Server Actions**, **React Compiler**
- CSR 중심 구조의 한계: 프로젝트 규모 증가 → JS 번들·hydration 비용 증가 → 초기 렌더링 성능 저하(모바일에서 특히 체감)
- React Query·SWR도 결국 브라우저 JS 실행 이후 데이터를 요청하는 구조, `useEffect` 기반 페칭은 "렌더링 이후 데이터 요청" 한계
- **Server Components**: 서버에서 먼저 데이터를 가져와 클라이언트 JS 전달량 자체를 감소 — React 18에서 제시, App Router를 거쳐 React 19 이후 안정화
- **Streaming UI**: `Suspense` 경계 기준으로 준비된 영역부터 먼저 전달, 페이지 전체 완성을 기다리지 않음
- **React Compiler**: 메모이제이션 최적화를 컴파일 단계에서 자동 처리, 2025년 10월 1.0 stable 릴리즈
- 흐름의 배경: 서비스 규모 확대와 모바일 성능 기대치 상승, Vue·Svelte 등 경쟁 프레임워크의 "단순함" 공세에 대한 대응 성격도 있음

## 관련 개념
- [[CSR과 SSR 렌더링 방식]] — Server Components·Streaming이 대응하는 CSR의 근본적 한계(초기 로딩, SEO)
- [[Next.js 레이아웃과 템플릿]] — App Router의 layout·template·Suspense를 활용한 스트리밍 구현 실무
- [[React 컴포넌트 성능 최적화]] — React Compiler가 자동화하려는 기존 수동 메모이제이션 최적화 기법
- [[React 상태 관리]] — 서버 컴포넌트와 클라이언트 컴포넌트 간 상태 경계 설계

## 출처
- [App Router 이후 React 생태계 동향](https://story.pxd.co.kr/1902) — 2026-06-22, hongdoyoung
