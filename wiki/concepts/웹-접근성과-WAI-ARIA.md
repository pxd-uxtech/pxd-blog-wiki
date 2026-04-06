---
type: concept
domain: "웹 개발"
name: "웹 접근성과 WAI-ARIA"
sources: ["/1588"]
updated: "2026-04-06"
---
# 웹 접근성과 WAI-ARIA

**웹 접근성**은 신체적·환경적 조건에 관계없이 모든 사용자가 웹 서비스를 동등하게 이용할 수 있도록 하는 설계 원칙이다. 한국에서는 법적으로 모든 웹사이트가 접근성 지침을 준수해야 한다. 그러나 **React, Vue, Angular** 같은 **SPA(Single Page Application)** 환경이 보편화되면서 동적 콘텐츠에 대한 접근성 보장이 더 어려워졌고, 이를 해결하기 위한 표준이 **WAI-ARIA**다.

**WAI-ARIA(Web Accessibility Initiative - Accessible Rich Internet Applications)**는 W3C의 웹 접근성 담당 기관 WAI가 정의한 RIA(Rich Internet Application) 환경의 접근성 표준이다. Ajax나 JavaScript로 실시간 변경되는 콘텐츠는 **스크린 리더** 같은 보조 기술이 감지하기 어렵다. WAI-ARIA는 HTML 태그에 `role`, `property`, `state` 속성을 추가해 개발자의 UI 의도와 구조적 정보를 보조 기술에 전달하는 방식으로 이 문제를 해결한다.

사용 시 주의할 점은 **HTML5의 시맨틱 태그**를 우선 사용하고 WAI-ARIA는 보완적으로 추가해야 한다는 것이다. `<nav>`에 `role="navigation"`을 중복 선언하는 것처럼 HTML5 시맨틱 요소와 ARIA role을 함께 쓰면 안 된다. ARIA의 랜드마크 역할(navigation, main, banner, search, contentinfo 등)은 HTML5 시맨틱 태그와 일대일 대응 관계를 가지므로, 태그로 의미를 부여할 수 없을 때만 ARIA role을 사용한다. **라이브 리전(Live Region)** 속성을 사용하면 Ajax로 변경되는 콘텐츠를 스크린 리더가 자동으로 감지하고 읽을 수 있다.

## 핵심 내용
- WAI-ARIA: W3C가 정의한 동적 웹 환경의 접근성 표준 (role, property, state 속성)
- HTML5 시맨틱 태그가 우선, ARIA는 의미 부여가 불가한 경우에만 보완적으로 사용
- 랜드마크 역할: navigation, main, banner, search, contentinfo 등
- 라이브 리전(aria-live): 실시간 변경 콘텐츠를 보조 기술에 자동 전달
- SPA 환경에서 접근성 보장이 어려워지면서 WAI-ARIA의 중요성 증가
- 접근성 작업은 시간과 비용이 많이 들어 실무에서 후순위로 밀리는 경향이 있음

## 관련 개념
- [[UI 컴포넌트 용어]] — UI 컴포넌트의 역할(role)과 상태(state)는 ARIA의 핵심 표현 대상
- [[웹 아키텍처]] — SPA와 Ajax 환경에서 접근성 문제가 심화됨

## 출처
- [WAI-ARIA란?](https://story.pxd.co.kr/1588) — 2021-09-30, seonju.lee
