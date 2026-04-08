---
type: concept
domain: "웹 개발"
name: "Next.js 레이아웃과 템플릿"
sources: ["/1831"]
updated: "2026-04-07"
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

## 핵심 내용
- **layout.tsx**: 서버 컴포넌트 기본, **세그먼트 트리에서 재사용** → 동적 데이터·pathname 사용 금지
- **template.tsx**: 페이지 이동마다 새 인스턴스 생성 → 에러 바운더리·리소스 초기화에 적합
- 레이아웃에서 동적 데이터가 필요하면 **클라이언트 컴포넌트로 분리**
- 템플릿은 메모리 누수 방지를 위해 **클린업 함수 등록 필수**
- 병렬 라우트 + Suspense로 **계단식 스트리밍** → 초기 로딩 개선
- React Profiler로 템플릿 렌더링 성능 모니터링

## 관련 개념
- [[React 컴포넌트 패턴]] — Next.js의 컴포넌트 패턴은 React 패턴 위에 있음
- [[React 상태 관리]] — 클라이언트 컴포넌트 상태와의 경계 설계

## 출처
- [Next.js 레이아웃과 템플릿 - 동작 원리와 최적화](https://story.pxd.co.kr/1831) — doworld, UX Engineer 이야기
