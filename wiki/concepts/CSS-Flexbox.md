---
type: concept
domain: "웹 개발"
name: "CSS Flexbox"
sources: ["/1603"]
updated: "2026-04-06"
---
# CSS Flexbox

**CSS Flexbox(Flexible Box Layout)**는 `float` 기반 레이아웃을 대체하는 현대적인 CSS 레이아웃 방식이다. `display: flex`를 선언한 요소가 **flex-container**가 되고, 그 자식 요소들이 **flex-item**이 된다. 반응형 디자인 구현에 핵심적으로 사용되며, 복잡한 정렬 작업을 간결한 코드로 처리할 수 있다.

**flex-container**의 주요 속성은 다음과 같다. `flex-direction`은 아이템 배치 방향을 결정하며 `row`(기본, 가로), `row-reverse`, `column`(세로), `column-reverse` 값을 가진다. `flex-wrap`은 아이템이 컨테이너 너비를 초과할 때의 줄바꿈 방식으로 `nowrap`(기본), `wrap`, `wrap-reverse`를 지원한다. `justify-content`는 주축(main axis) 방향의 정렬로 `flex-start`, `flex-end`, `center`, `space-between`, `space-around`, `space-evenly`를 제공한다. `align-items`는 교차축(cross axis) 정렬로 `stretch`(기본), `flex-start`, `flex-end`, `center`, `baseline` 값을 가진다.

`display: flex`는 블록 레벨 컨테이너를 만들고, `display: inline-flex`는 인라인 레벨 flex 컨테이너를 만든다. **주축**과 **교차축**의 개념을 이해하는 것이 Flexbox 마스터의 핵심이다. `flex-direction`에 의해 주축이 정해지고, 주축과 수직인 방향이 교차축이 된다. `justify-content`는 주축을, `align-items`는 교차축을 제어한다.

**flex-item** 속성 중 `flex-grow`, `flex-shrink`, `flex-basis`를 축약한 `flex` 속성은 아이템의 공간 분배 방식을 제어한다. `flex: 1`은 남은 공간을 균등하게 분배하는 가장 많이 쓰이는 패턴이다.

## 핵심 내용
- **flex-container**: `display: flex` 선언으로 생성, 자식이 flex-item이 됨
- `flex-direction`으로 주축 방향 결정 → `justify-content`·`align-items` 의미가 달라짐
- `justify-content`: 주축 정렬 / `align-items`: 교차축 정렬
- `flex-wrap: wrap`으로 아이템이 여러 줄에 걸쳐 배치되는 반응형 레이아웃 구현
- `float` 대비 코드량 감소와 수직 중앙 정렬 등 까다로운 레이아웃을 쉽게 처리

## 관련 개념
- [[SCSS 모듈 시스템]] — CSS 레이아웃과 함께 사용하는 스타일 모듈화 방법
- [[PWA 프로그레시브 웹 앱]] — 반응형 웹 레이아웃 구현의 기반 기술
- [[웹 접근성과 WAI-ARIA]] — 시각적 레이아웃과 접근성 마크업의 관계

## 출처
- [FLEX-box를 FLEX 했지 뭐야!](https://story.pxd.co.kr/1603) — 2021-12-06, 알 수 없는 사용자
