---
type: concept
domain: "웹 개발"
name: "JavaScript Date 라이브러리"
sources: ["/1758"]
updated: "2026-04-06"
---
# JavaScript Date 라이브러리

프론트엔드 개발에서 날짜와 시간을 다루기 위해 Moment.js, Day.js, date-fns 세 가지 라이브러리가 대표적으로 사용된다. 각각은 기능 범위·번들 크기·API 방식에서 뚜렷한 차이가 있어 프로젝트 성격에 맞는 선택이 필요하다.

Moment.js는 2011년부터 사용된 가장 오래된 라이브러리로 날짜 파싱·포맷팅·국제화 등 풍부한 기능을 제공하고 커뮤니티 자료가 방대하다. 그러나 미니파이 기준 약 60KB로 번들 크기가 크고, Tree Shaking을 지원하지 않으며, 객체가 가변(mutable)이라 예기치 않은 버그 위험이 있다. 개발팀이 공식적으로 기능 개발을 중단해 장기 사용 가능성도 불투명하다.

Day.js는 Moment.js와 거의 동일한 API를 유지하면서 약 2KB의 극소 번들 크기를 달성한 라이브러리다. Moment.js에서 Day.js로의 전환이 쉽고, 불변 객체 방식으로 안정성도 높다. 복잡한 날짜 처리나 고급 기능은 별도 플러그인 설치가 필요해 의존성 관리가 복잡해질 수 있다.

date-fns는 함수형 API 방식으로 필요한 함수만 import하여 번들 크기를 최소화할 수 있는 모듈화 설계가 특징이다. Tree Shaking 친화적이며 최신 JavaScript 기능을 활용해 성능이 우수하다. 단, 체인 방식의 API에 익숙한 개발자에게는 함수 기반 API가 초기 러닝 커브로 작용할 수 있다.

## 핵심 내용
- Moment.js: 기능 풍부·안정적이나 60KB 번들·개발 중단·가변 객체가 단점
- Day.js: 2KB 경량·Moment.js API 호환·불변 객체 지원, 고급 기능은 플러그인 필요
- date-fns: 모듈화·Tree Shaking 최적·함수형 API, 국제화는 별도 패키지 필요
- 번들 크기 우선 시 Day.js, 모듈화·Tree Shaking 우선 시 date-fns 추천
- 셋 모두 복잡한 시간대(timezone) 처리는 추가 플러그인 또는 별도 도구 필요

## 관련 개념
- [[웹 아키텍처]] — 프론트엔드 번들 최적화 맥락에서 라이브러리 선택이 중요
- [[AI 코딩 도구 활용]] — AI 코딩 도구를 활용해 Date 라이브러리 마이그레이션을 자동화하는 사례

## 출처
- [Date 라이브러리 비교(Moment.js / Day.js / date-fns)](https://story.pxd.co.kr/1758) — 2024-03-19, bareum.park
