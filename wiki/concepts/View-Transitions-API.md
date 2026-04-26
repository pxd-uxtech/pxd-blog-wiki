---
type: concept
domain: "프론트엔드 개발"
name: "View Transitions API"
sources: ["/1851"]
updated: "2026-04-27"
---
# View Transitions API

**View Transitions API**는 HTML 요소 간 전환 상태를 브라우저가 자동으로 계산해 자연스러운 애니메이션을 생성하는 웹 표준 API다. SPA(Single Page Application)에서 기존의 CSS/JavaScript 수작업 애니메이션이 가진 복잡성과 성능 문제를 해결하기 위해 등장했다.

기존 SPA 화면 전환에서는 페이지가 갑작스럽게 바뀌는 "툭" 끊기는 느낌이 문제였다. 이를 해결하려면 CSS `opacity`, `transform`, 또는 JavaScript 애니메이션을 수작업으로 구현해야 했는데, 구성 요소가 바뀌는 구조에서 애니메이션을 관리하기 복잡하고 성능도 보장되지 않는다는 한계가 있었다. View Transitions API는 이 번거로움을 해소하고, **브라우저가 상태 전환 전후의 시각 요소를 감지해 자동으로 애니메이션을 생성**하는 방식으로 동작한다.

**기본 사용법**: `document.startViewTransition()` 안에서 DOM이 바뀌는 로직을 실행하면, 브라우저가 이전 상태와 이후 상태를 비교해 자연스럽게 화면을 넘긴다. 개발자는 상태 전환 로직만 작성하고, 애니메이션은 브라우저에게 위임할 수 있다. API를 지원하지 않는 브라우저를 위한 **fallback 분기 처리**가 필요하다.

기존 수작업 방식과 비교하면 View Transitions API는 DOM 변경만으로 여러 요소의 전환을 자동 처리하고, `setTimeout` 같은 딜레이 타이밍 조정이 불필요하며, 코드량과 유지 보수 복잡도를 크게 낮춘다. 반면 기존 방식은 CSS/JS가 분산되고 상태 관리가 필요하며 각 요소별 수동 지정이 필요하다.

**브라우저 지원 현황(2025년 기준)**: Chrome 111+, Edge 111+, Opera 97+ (Chromium 기반), Safari 18+ / iOS 18+(same-document 전환), Firefox 142부터 지원 예정(현재 미지원). 2022년 6월 Chrome 104 실험 기능으로 처음 등장했으며 2023년 3월 Chrome 111부터 기본 지원을 시작했다.

**주의 사항과 한계**: HTML 요소 간 구조 차이가 너무 크면 자연스러운 애니메이션이 어렵다. Firefox가 아직 미지원이므로 브라우저 지원 범위 체크와 fallback 로직이 필수다. 애니메이션이 시작되기까지 DOM 변경 타이밍 제어가 어렵거나 어색할 수 있으며, 세세한 마이크로 인터랙션 제어보다는 **페이지 단위 전환**에 적합하다. 또한 현재는 W3C 표준이 아닌 WICG(Web Incubator Community Group) 초안 단계이나, Chrome·Safari·Edge 등 주요 브라우저들이 빠르게 채택하면서 실무 활용이 가능한 기술로 자리잡고 있다.

## 핵심 내용
- `document.startViewTransition(() => { /* DOM 변경 로직 */ })` 패턴으로 사용
- 브라우저가 전환 전후 상태를 비교해 자동으로 애니메이션 생성
- 기존 방식 대비 코드량 감소, 유지 보수성 향상, 복잡한 구조에서도 통합 전환 처리
- Chrome/Edge/Opera/Safari 지원, Firefox 미지원(2025년 기준) → fallback 필수
- W3C 표준 미확정, WICG 초안 단계 → 향후 사양 변경 가능성 존재
- 페이지 단위 전환에 적합, 세밀한 마이크로 인터랙션 제어는 불리

## 관련 개념
- [[React 컴포넌트 패턴]] — SPA 구조에서 상태 변경과 화면 전환의 관계
- [[React 상태 관리]] — 화면 전환 로직과 상태 변경을 연결하는 패턴
- [[현대 CSS 기능]] — CSS 기반 애니메이션과의 비교 및 보완 관계
- [[PWA 프로그레시브 웹 앱]] — 네이티브 앱 수준의 화면 전환 경험 구현과 연결

## 출처
- [View Transitions API로 살펴보는 자연스러운 SPA 화면 전환 방식](https://story.pxd.co.kr/1851) — 2025-08-25, shushushu, UX Engineer 이야기
