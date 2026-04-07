---
type: concept
domain: "웹 개발"
name: "SVG 차트 구현"
sources: ["/1639"]
updated: "2026-04-07"
---
# SVG 차트 구현

차트 라이브러리 없이 **SVG**만으로 간단한 차트를 그릴 수 있다. 라이브러리 의존성을 줄이고 디자인을 정교하게 제어해야 할 때 유용한 접근법이다.

**라인 차트**는 `<polyline>` 요소의 `points` 속성에 `x,y x,y x,y …` 형식으로 좌표를 나열해 그린다. 스타일은 `stroke`(색상), `stroke-width`(두께), `fill: none`(면 제거)로 지정하며, 디자인 변경이 쉽도록 CSS로 분리하는 것이 좋다. 등장 애니메이션은 SVG `width` 사이즈 전환, dot 버튼은 CSS `transform: scale()`로 구현한다.

**파이 차트**는 `<circle>` 요소의 `stroke-dasharray`와 `stroke-dashoffset` 속성을 활용한다. `stroke-dasharray`를 원 전체 둘레(`2πr`)로 설정하면 꽉 채워진 스트로크가 되고, `stroke-dashoffset`을 조정해 차트 값의 비율만큼 비울 수 있다. 다중 값 파이는 각 `<circle>`에 `rotate`를 적용하여 시작 위치를 누적 이동시킨다. SVG는 반시계 방향으로 그려지므로 시계방향 표현이 필요하면 `transform: scaleX(-1)`로 좌우 반전한다.

iOS에서는 `position` 및 회전 애니메이션 관련 버그가 자주 발생하는데, 배경용 circle을 하나 더 겹쳐놓고 이를 제거하는 방식(배경을 지워 진행도가 드러나게 하는 트릭)으로 회피할 수 있다.

## 핵심 내용
- **라인 차트**: `<polyline>` + `points` 속성으로 좌표 나열
- **파이 차트**: `<circle>` + `stroke-dasharray`와 `stroke-dashoffset`로 비율 표현
- 전체 원 둘레 공식: **2πr**, 차트 값 = 전체 둘레 − (전체 둘레 × 비율)
- 다중 값 파이: `rotate`로 각 circle 시작 각도 이동
- 시계 방향 표현: CSS `transform: scaleX(-1)`
- iOS 애니메이션 버그 회피: 배경 circle을 덮었다가 제거하는 트릭

## 관련 개념
- [[CSS 로딩 애니메이션]] — SVG와 CSS 조합으로 구현하는 또 다른 피드백 요소
- [[텍스트 임베딩과 데이터 시각화]] — 데이터 시각화의 상위 관점

## 출처
- [svg로 간단한 차트 구현하기](https://story.pxd.co.kr/1639) — Seulbi Lee, UX Engineer 이야기
