---
type: concept
domain: "웹 개발"
name: "CSS Grid"
sources: ["/1611"]
updated: "2026-08-03"
---
# CSS Grid

**CSS Grid**(CSS Grid Layout)는 웹 페이지를 격자(행과 열) 구조로 설계할 수 있게 하는 CSS3 레이아웃 명세다. 부모 요소에 `display: grid`를 선언하면 grid-container가 되고, `grid-template-columns`·`grid-template-rows` 속성으로 열과 행의 크기를 지정한다. 값에는 픽셀뿐 아니라 `auto`, `%`, `calc()`, `repeat()` 등 다양한 단위를 함께 사용할 수 있어 유연한 트랙 설계가 가능하다.

자식 요소의 배치는 `grid-column`·`grid-row`(각각 `-start`/`-end`의 축약)로 시작·끝 트랙 라인을 지정해 자유롭게 제어할 수 있고, `grid-gap`(`row-gap`·`column-gap`의 축약)으로 셀 사이 간격을 둘 수 있다. 더 복잡한 레이아웃에는 `grid-template-areas`를 사용하는데, 문자열이 행을, 문자열 안의 영역 이름이 열을 표현하고 자식 요소에 동일한 이름의 `grid-area`를 지정해 시각적으로 읽기 쉬운 형태로 레이아웃 구조를 선언할 수 있다. 빈 칸은 영역 이름 대신 `.`으로 표시한다.

Grid는 [[CSS Flexbox]]와 자주 비교된다. Flexbox가 수평 또는 수직 한 방향의 선형적 구조에 최적화되어 있다면, Grid는 행과 열을 동시에 다루는 2차원 격자형 구조로 더 입체적이고 복잡한 레이아웃 설계가 가능하다. 실무에서는 두 속성을 상호 배타적으로 쓰기보다 레이아웃의 성격에 맞게 함께 사용하는 경우가 많다.

Grid는 모든 IE에서 온전히 지원되지 않는다는 한계가 있다. IE11은 구형 스펙 기반 프리픽스로 부분 지원하지만 최신 문법과 중복 선언이 필요해 실무 도입의 걸림돌이 된다. 국내 웹 환경은 여전히 IE 지원을 완전히 배제하기 어려운 경우가 많아, 크롬 엔진 기반 웹뷰어처럼 IE 제약이 없는 폐쇄 환경에서 먼저 적극적으로 활용되는 경향이 있다. Windows 11에서 IE가 자취를 감춘 이후 이 제약은 점차 완화되고 있으며, `masonry` 값 등 후속 스펙도 논의되고 있다.

## 핵심 내용
- `display: grid` 선언으로 grid-container 생성
- `grid-template-columns`/`grid-template-rows`로 트랙 크기 설계 (px, %, auto, calc(), repeat() 조합 가능)
- `grid-column`/`grid-row`로 자식 요소의 시작·끝 라인 배치 제어
- `grid-gap`(`row-gap`+`column-gap`)으로 셀 간격 설정
- `grid-template-areas` + `grid-area`로 이름 기반 레이아웃 선언 — 빈 영역은 `.`
- Flexbox(1차원 선형 구조) vs Grid(2차원 격자 구조) — 레이아웃 성격에 따라 선택 또는 병행
- IE11은 구형 프리픽스로만 부분 지원, 실무에서는 여전히 크로스브라우저 이슈로 도입에 제약

## 관련 개념
- [[CSS Flexbox]] — 1차원 선형 레이아웃 방식, Grid와 상호 보완적으로 사용됨
- [[현대 CSS 기능]] — Grid를 확장한 Subgrid 등 최신 레이아웃 스펙
- [[크로스브라우저 호환성]] — IE 등 구형 브라우저의 CSS3 스펙 미지원 문제

## 출처
- [CSS3 Grid 사용기](https://story.pxd.co.kr/1611) — 2022-01-24, hongdoyoung
