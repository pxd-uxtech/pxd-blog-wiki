---
type: concept
domain: "웹 개발"
name: "현대 CSS 기능"
sources: ["/1858", "/1834"]
updated: "2026-04-27"
---
# 현대 CSS 기능

**현대 CSS 기능**은 2020년대 이후 브라우저에 표준으로 정착한 CSS 스펙들로, 디자인 시스템 시대의 컴포넌트 기반 UI 개발을 더 효율적으로 지원한다. 단순히 디자인을 "그대로 구현"하는 수준을 넘어, 시스템화된 UI를 구성하는 구조적 접근을 가능하게 한다.

## 핵심 개념

- **Container Query (`@container`)**: 전체 화면 너비(뷰포트) 기준이 아닌 **부모 요소 크기**를 기준으로 반응형 스타일을 적용한다. 재사용 가능한 컴포넌트(카드, 배너 등)를 어디에 배치하더라도 컴포넌트 단위로 반응형 설계가 가능하다. `container-type: inline-size`를 부모에 선언해야 작동한다.
  ```css
  .card { container-type: inline-size; }
  @container (min-width: 600px) {
    .card-title { font-size: 1.5rem; }
  }
  ```
- **Cascade Layers (`@layer`)**: CSS 스타일의 **우선순위를 계층으로 명시적으로 선언**한다. 기존에는 로딩 순서나 `!important`로 관리하던 스타일 충돌을 체계적으로 해결한다. `reset → base → components → overrides` 같이 레이어 순서를 선언하면 이후 어느 파일에 작성해도 우선순위가 고정된다.
  ```css
  @layer reset, base, components, overrides;
  ```
- **`:has()` 선택자**: **부모 요소가 특정 자식을 포함할 때** 조건부 스타일을 적용한다. 기존에는 자식 상태에 따라 부모 스타일을 바꾸려면 JavaScript가 필요했지만, `:has()`로 CSS만으로 가능해졌다.
  ```css
  .card:has(img) { padding-top: 0; }
  ```
- **View Transitions API**: 페이지 또는 컴포넌트 상태 변화 시 **부드러운 전환 애니메이션**을 선언적으로 구현한다. MPA(Multi-Page App)와 SPA 모두 지원 방향으로 발전 중이다.
- **Figma Dev Mode**: 디자이너가 Figma에서 작성한 디자인을 개발자가 CSS·코드로 변환하는 과정을 지원하는 기능. 디자인-개발 간 핸드오프 효율을 높인다.

## Subgrid와 Container Queries로 UX 향상하기

**CSS Subgrid**는 CSS Grid Layout의 확장 기능으로, 자식 요소가 **부모 그리드의 트랙(행/열)을 직접 상속**받아 정렬에 참여할 수 있게 한다. 기존 Grid에서는 중첩 컴포넌트가 독립적인 그리드 컨텍스트를 가져 부모와 정렬이 맞지 않는 문제가 있었다. Subgrid를 사용하면 카드 컴포넌트 내부의 제목·본문·버튼이 여러 카드에 걸쳐 동일한 행 기준으로 정렬되어, 높이가 다른 콘텐츠도 시각적 일관성을 유지한다.

```css
.grid { display: grid; grid-template-columns: repeat(3, 1fr); }
.card { display: grid; grid-row: span 3; grid-template-rows: subgrid; }
```

**Container Queries**는 미디어 쿼리의 한계를 극복한다. 기존 미디어 쿼리(`@media`)는 뷰포트 전체 크기를 기준으로 하여, 사이드바에 배치된 카드와 메인 영역에 배치된 같은 카드가 동일한 브레이크포인트를 공유해야 했다. Container Queries는 컴포넌트가 **자신이 놓인 컨테이너의 크기**에 반응하므로, 재사용 가능한 컴포넌트를 다양한 레이아웃 맥락에 그대로 배치할 수 있다. 이 두 기능을 함께 사용하면 복잡한 레이아웃에서도 컴포넌트 독립성과 시각적 정렬을 동시에 달성할 수 있다.

UX 관점에서 Subgrid와 Container Queries가 가져오는 가치는 **정보 스캔 효율성**이다. 카드 목록에서 동일한 행 높이가 맞춰지면 사용자가 비교·스캔하기 쉬워지고, 반응형 환경에서도 콘텐츠 계층이 무너지지 않는다.

## 실무 적용

디자인 시스템을 구축하거나 운영하는 환경에서 이 기능들은 특히 유용하다. **Container Query**는 컴포넌트 재사용성을 높이고, **Cascade Layers**는 공통 스타일 관리의 복잡도를 줄인다. **`:has()`**는 상태 기반 조건부 스타일링에서 JavaScript 의존도를 낮춘다. **Subgrid**는 카드 목록·데이터 테이블처럼 열 정렬이 중요한 컴포넌트에 특히 효과적이다. 단, 브라우저 지원 범위를 확인하고 도입해야 하며, 레거시 프로젝트에 적용 시 기존 스타일과의 충돌 여부를 사전에 검토해야 한다.

## 참고

- [[디자인 시스템]] — CSS 기능이 실제로 적용되는 구조적 맥락
- [[CSS Flexbox]] — 레이아웃 설계의 기초
- [[CSS 폰트 기능 설정]] — 타이포그래피 관련 CSS
- [[스토리북 컴포넌트 개발]] — 컴포넌트 기반 개발 환경
- [[디자이너 개발자 협업]] — Figma Dev Mode와 연결되는 협업 흐름

## 출처

- [디자인 시스템 시대, UI 개발자가 주목해야 할 웹 기능들](https://story.pxd.co.kr/1858) — UX Engineer 이야기
- [Subgrid, Container Queries로 UX 향상시키기](https://story.pxd.co.kr/1834) — 2025-03-31, shushushu
