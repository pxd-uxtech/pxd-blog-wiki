---
type: concept
domain: "웹 개발"
name: "Next.js 레이아웃과 템플릿"
sources: ["/1828", "/1831"]
updated: "2026-04-27"
---
# Next.js 레이아웃과 템플릿

**Next.js의 App Router**에서 **layout.tsx**와 **template.tsx**는 페이지 간 공유 UI를 정의하는 두 가지 방식이지만, 동작 원리와 사용 맥락이 크게 다르다.

## 레이아웃(layout.tsx)

**레이아웃**은 기본적으로 **서버 컴포넌트**로 동작하며, 한 번 렌더링된 후에는 **세그먼트 트리에서 지속적으로 재사용**된다. 이 특성은 성능 이점이지만 동시에 안티패턴을 만든다.

**레이아웃에서 피해야 할 패턴**:
- **동적 데이터 직접 사용**: `headers()`, `getServerSession()` 같은 매 요청 데이터를 레이아웃에서 호출하면 캐시되어 실시간 반영이 안 된다 → **클라이언트 컴포넌트로 분리**.
- **라우트 변경에 따른 상태 관리**: `usePathname()` 등을 레이아웃에서 사용하면 변경 감지가 안 됨 → 클라이언트 컴포넌트에서 처리.

```tsx
// 🚫 Anti-pattern
export default async function DashboardLayout({ children }) {
  const session = await getServerSession() // 캐시되어 실시간 반영 안 됨
  return <div>Welcome, {session?.user?.name}</div>
}

// ✅ Better: 클라이언트 컴포넌트로 분리
'use client'
function UserGreeting() {
  const { data: session } = useSession()
  return <div>Welcome, {session?.user?.name}</div>
}
```

## 템플릿(template.tsx)

**템플릿**은 React의 **리컨실레이션(reconciliation)** 과정에서 **완전히 새로운 인스턴스를 생성**한다. 페이지 이동마다 다시 마운트되므로 **메모리 관점**에서 중요한 의미를 갖는다.

**템플릿의 적합한 활용**:
- **페이지별 에러 바운더리** 적용
- **리소스 집약적 기능 초기화 + 클린업**: 차트·WebSocket·이벤트 리스너 등을 `useRef`로 등록하고 unmount 시 정리
- **렌더링 성능 측정**: React Profiler 활용

```tsx
'use client'
export default function DashboardTemplate({ children }) {
  const cleanup = useRef([])
  const pathname = usePathname()
  
  useEffect(() => {
    const chart = initializeChart()
    const websocket = initializeWebSocket()
    cleanup.current.push(() => { chart.destroy(); websocket.close() })
    return () => cleanup.current.forEach(fn => fn())
  }, [pathname])
  
  return <div>{children}</div>
}
```

## 고급 최적화: Suspense와 스트리밍

레이아웃에서 **병렬 라우트(parallel routes)**와 **Suspense**를 결합하면 초기 페이지 로딩 성능을 크게 개선할 수 있다.

```tsx
export default function Layout({ children, analytics, team }) {
  return (
    <div className="flex">
      <div>{children}</div>
      <Suspense fallback={<Loading />}>{analytics}</Suspense>
      <Suspense fallback={<Loading />}>{team}</Suspense>
    </div>
  )
}
```

## Intercepting Routes와 모달 UX

**Intercepting Routes**는 Next.js 13.3에서 추가된 라우팅 기능으로, 현재 레이아웃 컨텍스트를 유지한 채 다른 경로의 콘텐츠를 가로채서 모달이나 슬라이드 오버로 표시할 수 있다.

폴더 명명 규칙으로 인터셉트할 경로를 지정한다. `(.)`는 동일 레벨, `(..)`는 한 단계 위, `(...)`는 루트 디렉토리를 기준으로 동작한다. 앱 내 링크 클릭 시에는 인터셉트된 모달 버전이 표시되고, URL 직접 입력이나 새로고침 시에는 원래 전체 페이지가 로드된다.

인스타그램 PC 웹이 대표적인 사례다. 피드에서 사진을 클릭하면 현재 컨텍스트가 유지된 채 모달로 열리고 URL이 변경된다. 새로고침하면 해당 사진의 독립 상세 페이지로 이동한다.

이 패턴을 **Parallel Routes**(`@folder` 슬롯)와 함께 사용하면, 동일 라우트에서 여러 페이지를 동시에 또는 조건부로 렌더링하는 복잡한 레이아웃을 구현할 수 있다. 모달 콘텐츠가 고유한 URL을 가지므로 **공유 가능성**, **SEO 친화성**, **히스토리 API 통합**이라는 세 가지 이점이 있다.


## 핵심 내용
- **layout.tsx**: 서버 컴포넌트 기본, **세그먼트 트리에서 재사용** → 동적 데이터·pathname 사용 금지
- **template.tsx**: 페이지 이동마다 새 인스턴스 생성 → 에러 바운더리·리소스 초기화에 적합
- 레이아웃에서 동적 데이터가 필요하면 **클라이언트 컴포넌트로 분리**
- 템플릿은 메모리 누수 방지를 위해 **클린업 함수 등록 필수**
- 병렬 라우트 + Suspense로 **계단식 스트리밍** → 초기 로딩 개선
- React Profiler로 템플릿 렌더링 성능 모니터링
- **Intercepting Routes**: `(..)` 명명 규칙으로 모달 UX 구현, URL 유지·공유 가능
- 인터셉트 경로와 실제 경로 양쪽 모두 구현 필수 (클라이언트 탐색 vs 직접 접근)

## 관련 개념
- [[React 컴포넌트 패턴]] — Next.js의 컴포넌트 패턴은 React 패턴 위에 있음
- [[React 상태 관리]] — 클라이언트 컴포넌트 상태와의 경계 설계

## 출처
- [라우팅 인터셉트 기능을 활용한 모달 인터랙션 향상](https://story.pxd.co.kr/1828) — 2025-01-20, doworld
- [Next.js 레이아웃과 템플릿 - 동작 원리와 최적화](https://story.pxd.co.kr/1831) — doworld, UX Engineer 이야기
