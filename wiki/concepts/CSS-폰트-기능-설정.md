---
type: concept
domain: "웹 개발"
name: "CSS 폰트 기능 설정"
sources: ["/1717"]
updated: "2026-04-07"
---
# CSS 폰트 기능 설정

**font-feature-settings**는 **오픈 타입 글꼴(OpenType)**의 고급 설정을 제어하는 CSS 속성이다. **font-variant** 계열 속성을 4글자 태그로 축약해 한 줄로 지정할 수 있다. 중요한 전제: 해당 기능은 **글꼴이 지원해야**만 작동한다.

**font-variant-ligatures / 'liga'**: **합자(ligature)** 기능을 제어한다. "-"와 ">"를 연달아 쓰면 "→"로 합쳐지는 화살표, 코딩용 글꼴의 연산자 "≠" 변환 등이 대표적이다. `'liga' 1`(common), `'clig'`(contextual), `'dlig'`(discretionary), `'hlig'`(historical) 네 종류가 있다.

**font-variant-caps / 'smcp', 'c2sc'**: 대체 대문자 스타일. **스몰캡(small-caps)**, all-small-caps(`c2sc`), petite-caps(`pcap`), titling-caps(`titl`) 등을 통해 대문자의 크기·비중을 조절해 본문의 톤을 부드럽게 만들 수 있다.

**font-variant-alternates / 'swsh'**: **스와시 글리프(swash)** 등 대체 글리프를 선택한다. `font-feature-settings: 'swsh' 2`처럼 숫자로 몇 번째 대체 글리프인지 지정할 수 있는 것이 특징이며, 이는 `font-variant-alternates`로는 불가능한 인덱싱 기능이다.

**font-variant-numeric**: 숫자 글리프 제어. `'lnum'`(lining), `'onum'`(oldstyle), `'pnum'`(proportional), `'tnum'`(tabular) 등으로 표·수식·화폐 표기에서 **숫자 너비 정렬**이나 **고풍스러운 숫자 스타일**을 구현한다. 특히 `tnum`(tabular-nums)은 대시보드·금액 표시의 정렬 품질을 높인다.

**Figma**에서는 텍스트 레이어의 **Details 탭**에서 해당 속성들을 설정할 수 있다. 다만 CSS 속성명과 Figma의 항목명이 일치하지 않아 개발자가 매핑에 혼란을 겪기 쉽다. 글꼴의 지원 여부는 **fontdrop**처럼 글꼴 파일을 등록해 글리프 속성을 토글로 확인하는 사이트에서 사전 검증하면 좋다.

## 핵심 내용
- **font-feature-settings**: OpenType 고급 기능을 4글자 태그로 일괄 제어
- 합자(`liga`) · 스몰캡(`smcp`) · 스와시(`swsh`) · 숫자 스타일(`lnum`/`tnum`)
- **tabular-nums**는 표·대시보드의 숫자 정렬 품질을 크게 개선
- 글꼴이 지원해야만 작동 → 디자인 시안과 실제 렌더링이 다르다면 이 속성을 의심
- Figma Details 탭에서 설정 가능하나 CSS 속성명과 이름이 달라 주의

## 관련 개념
- [[디자인 시스템]] — 타이포그래피 시스템에서 숫자·대문자 스타일 일관성 확보
- [[CSS Flexbox]] — 타이포그래피와 함께 레이아웃을 구성하는 기본 기술
- [[웹 접근성과 WAI-ARIA]] — 텍스트 가독성과 접근성 관점

## 출처
- [font-feature-settings](https://story.pxd.co.kr/1717) — hongdoyoung, UX Engineer 이야기
