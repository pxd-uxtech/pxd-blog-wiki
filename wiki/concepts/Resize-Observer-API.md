---
type: concept
domain: "프론트엔드 개발"
name: "Resize Observer API"
sources: ["/1735"]
updated: "2026-07-14"
---
# Resize Observer API

**Resize Observer API**는 DOM 요소의 크기 변화를 비동기적으로 감시하는 브라우저 표준 **Web API**다. 화면이 리사이즈될 때마다 특정 요소의 너비·높이 변화를 감지해야 하는 상황에서, 기존에는 `window`의 `resize` 이벤트를 구독해 처리했다. 그러나 이 방식은 뷰포트 전체 크기가 바뀔 때마다 이벤트가 호출되기 때문에 리스너를 꼼꼼히 해제하지 않으면 메모리 누수로 이어지기 쉽고, 불필요하게 잦은 호출을 막기 위해 **throttle**·**debounce** 같은 추가 처리가 관례적으로 필요했다. Resize Observer API는 관찰 대상 요소 자체의 크기 변화만을 효율적으로 감지해 이런 부가 작업 없이도 안정적으로 동작하며, 불필요한 리렌더를 줄여 성능 측면에서도 유리하다.

사용법은 `new ResizeObserver(callback)`으로 옵저버 인스턴스를 생성한 뒤, `observer.observe(target)`으로 감시할 요소를 등록하는 두 단계로 이루어진다. 콜백은 크기 변화가 감지될 때마다 `ResizeObserverEntry` 배열을 인자로 받으며, 각 엔트리는 `borderBoxSize`(padding+border+content를 합친 크기), `contentBoxSize`(content 영역만의 크기), `devicePixelContentBoxSize`(디바이스 픽셀 단위의 borderBox 크기), `contentRect`(x·y·top·left·right·bottom·width·height를 포함하는 `DOMRectReadOnly`), `target`(관찰 대상 요소) 다섯 가지 읽기 전용 값을 제공한다. 감시를 멈출 때는 특정 요소만 해제하는 `unobserve(target)`, 옵저버가 감시 중인 모든 요소를 한 번에 해제하는 `disconnect()` 두 메서드를 상황에 맞게 사용한다.

pxd XE그룹의 hyejun.lee는 **약관 자동화 코드**를 구현하던 중 이 API를 접했다고 소개하며, 앞서 다룬 **Intersection Observer API**(요소의 뷰포트 노출 여부 감시)의 연장선에 있는 성능 친화적 Web API 시리즈로 이 글을 위치시킨다. React에서는 `useRef`로 얻은 DOM 참조를 `observer.observe()`에 전달하는 방식으로 컴포넌트 내 특정 영역의 리사이즈를 감지하는 데 활용할 수 있다.

## 핵심 내용
- **Resize Observer API**: 요소 크기 변화를 비동기 감시하는 Web API, `window`의 `resize` 이벤트를 대체
- 기존 `resize` 이벤트 방식의 문제: 메모리 누수 위험 + throttle/debounce 같은 추가 처리 필요
- 사용법: `new ResizeObserver(callback)` 생성 → `observer.observe(target)`으로 감시 시작
- 콜백 엔트리 값: `borderBoxSize`, `contentBoxSize`, `devicePixelContentBoxSize`, `contentRect`, `target`
- 메서드: `observe(target)` / `unobserve(target)` / `disconnect()`(전체 해제)
- 리렌더 최소화로 `resize` 이벤트 대비 성능 효율이 좋음
- pxd 약관 자동화 코드에 실무 적용된 사례, Intersection Observer API의 연장선 성격의 Web API

## 관련 개념
- [[View Transitions API]] — pxd XE그룹이 소개한 또 다른 최신 브라우저 표준 Web API
- [[UX 엔지니어 직무와 XE 그룹]] — 이 글의 저자가 속한 조직과 기술 블로그 시리즈
- [[React 컴포넌트 성능 최적화]] — 불필요한 리렌더링을 줄이는 성능 최적화 맥락과 연결
- [[브라우저 렌더링 파이프라인]] — 레이아웃·리사이즈 감지가 렌더링 성능에 미치는 영향

## 출처
- [Resize Observer API](https://story.pxd.co.kr/1735) — 2023-11-24, hyejun.lee, UX Engineer 이야기
