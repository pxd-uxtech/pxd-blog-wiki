---
type: concept
domain: "프론트엔드 개발"
name: "Intersection Observer API"
sources: ["/1698"]
updated: "2026-08-05"
---
# Intersection Observer API

**Intersection Observer API**는 브라우저의 뷰포트와 특정 대상 엘리먼트가 교차하는지, 즉 그 요소가 화면에 보이는지 여부를 비동기적으로 감시하는 **Web API**다. 스크롤을 내리다 특정 시점에 이벤트를 실행해야 하는 실무 상황에서, 기존에는 `window`의 `scroll` 이벤트를 구독해 처리했다. 그러나 이 방식은 스크롤할 때마다 이벤트가 계속 호출되어 브라우저 성능에 부담을 줄 수 있다. Intersection Observer API는 비동기적으로 실행되기 때문에 이런 성능 부담 없이 요소의 노출 여부를 판별할 수 있다.

MDN 문서는 이 API가 특히 유용한 4가지 사용 사례를 제시한다. 페이지 스크롤 시 이미지·콘텐츠를 지연 로드하는 **Lazy load**, 스크롤에 따라 콘텐츠를 계속 로드·렌더링하는 **인피니티 스크롤**, 광고 수익 계산을 위한 광고 가시성 보고, 사용자가 결과를 볼 수 있는지에 따라 작업이나 애니메이션을 실행하는 경우다. 다만 한계도 있는데, 보여지는 영역을 정확한 px 값이 아니라 **비율(%)**로만 알 수 있다는 점이다.

사용법은 `callback`과 `options` 두 인자로 `new IntersectionObserver(callback, options)`를 생성한 뒤, `observer.observe(target)`으로 감시할 대상 요소를 등록하는 두 단계로 이루어진다. `options`는 `root`(뷰포트로 사용할 조상 요소, 기본값은 브라우저 뷰포트), `rootMargin`(CSS margin과 유사한 문법의 루트 여백, 백분율 지정 가능), `threshold`(가시성 비율 기준값, 기본 0이며 단일 숫자 또는 배열 지정 가능. 예: 요소의 50%가 보일 때 실행하려면 0.5)로 구성된다. 대상이 threshold 값을 충족할 때마다 `callback`이 `IntersectionObserverEntry` 객체 배열과 관찰자를 인자로 받아 호출되며, 각 엔트리는 `boundingClientRect`(타깃 요소의 사각형 정보), `intersectionRatio`(교차 영역의 백분율), `intersectionRect`(교차한 영역의 사각형 정보), `isIntersecting`(교차 여부 boolean), `rootBounds`(root 요소의 사각형 정보), `target`(대상 요소), `time`(교차가 시작된 시점)을 제공한다.

pxd XE Group Blog의 hyejun.lee는 매번 위 방식대로 직접 API를 호출하는 것이 비효율적이므로 실무에서는 커스텀 hook을 만들거나 `react-intersection-observer` 라이브러리를 활용하는 편이 더 편리하다고 조언한다. 글쓴이는 이 API를 처음 접하고 유용함에 놀랐다고 소개하며, 스크롤 이벤트를 모두 대체할 수는 없는 한계는 있지만 상황에 맞게 적용하면 브라우저 성능 향상에 도움이 된다고 정리한다.

## 핵심 내용
- **Intersection Observer API**: 뷰포트와 타깃 요소의 교차(노출) 여부를 비동기 감시하는 Web API, `scroll` 이벤트의 성능 부담을 대체
- 활용 사례(MDN 4가지): Lazy load, 인피니티 스크롤, 광고 가시성 보고, 노출 기반 애니메이션/작업 실행
- 한계: 노출 영역을 정확한 px가 아닌 **비율(%)**로만 판별 가능
- 사용법: `new IntersectionObserver(callback, options)` 생성 → `observer.observe(target)`으로 감시 시작
- `options`: `root`(뷰포트 대체 조상 요소), `rootMargin`(루트 여백), `threshold`(가시성 비율 기준, 기본 0)
- `callback` 엔트리 값: `boundingClientRect`, `intersectionRatio`, `intersectionRect`, `isIntersecting`, `rootBounds`, `target`, `time`
- 실무에서는 직접 호출보다 커스텀 hook 또는 `react-intersection-observer` 라이브러리 활용 권장

## 관련 개념
- [[Resize Observer API]] — 요소 크기 변화를 감시하는 유사한 성능 친화적 Web API, 같은 저자가 이어서 다룬 후속 주제
- [[React 컴포넌트 성능 최적화]] — 불필요한 이벤트 호출을 줄여 성능을 높이는 맥락과 연결
- [[UX 엔지니어 직무와 XE 그룹]] — 이 글의 저자가 속한 조직과 기술 블로그 시리즈

## 출처
- [Intersection Observer API](https://story.pxd.co.kr/1698) — 2023-05-29, hyejun.lee
