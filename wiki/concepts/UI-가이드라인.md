---
type: concept
domain: "디자인 시스템"
name: "UI 가이드라인"
sources: ["/1063", "/684", "/400", "/426", "/162"]
updated: "2026-07-23"
---
# UI 가이드라인

**UI 가이드라인**은 운영체제·플랫폼·제조사가 제시하는 사용자 인터페이스 표준 문서다. **Apple Human Interface Guidelines (HIG)**, **Microsoft Windows User Experience Guidelines**, **Material Design**, **Tizen**, **iOS HIG**, **OS X HIG** 등이 대표적이다. 신입 디자이너에게는 흔히 막연한 전공 필수과목처럼 느껴지지만, 실제로는 **UI 설계의 근거와 표현 방식의 보고**다.

**가이드라인을 효과적으로 읽는 3단계**:

1. **큰 줄기를 이해하며 다가가기**: 세세한 규정 이전에 가이드라인의 **목적·용도·시대적 배경**과 **유관 부서 사이의 관계**를 먼저 파악해야 한다. 가이드라인이 누구를 대상으로 작성되었는지, 어떤 위치에서 어떤 역할을 하는지를 머릿속에 그려두면 자연스럽게 중요성이 와닿는다.

2. **내용을 면밀히 살펴가며 읽기**: 목차로 무엇을 중요하게 다루는지 예측하고, 각 규정의 **근거**(심리학, 트렌드, 제품 특성, 브랜드 이미지, OS 일관성 등)를 염두에 두며 읽기. 정책의 표현 방식—**Do/Don't의 명확성** vs **유려한 감성적 기술**—에도 주목. **Apple HIG**는 정체성을 가이드라인에 담아내는 대표 사례.

3. **여러 가이드라인 비교하며 활용하기**: 디바이스·OS별로 비교하면 각 제품의 전략과 색깔이 드러난다. 진행 중 프로젝트의 **아이디어 소스**로, 또는 디자인 결정의 **설득 도구**로도 활용할 수 있다. 가이드라인의 권위는 디자인 타당성을 높이는 강력한 자원이다.

**학습 효과 순서**: 글로 읽기 < 가이드라인을 활용해 작성·분석 < **실제 프로젝트에서 가이드라인을 직접 작성**. 본인이 가이드라인을 작성해본 경험이 가장 빠르고 정확한 이해 방법이다.

**주요 가이드라인 분류**:
- **Mobile/Desktop**: Android(Material Design), Tizen, iOS HIG, OS X HIG, Blackberry, Windows, Ubuntu UI Style Guide
- **TV**: Samsung Smart TV, Samsung Tizen-based TV, LG Web OS, LG Smart TV, Google TV, Android TV, Amazon TV, Roku
- **Wearable**: Google Glass, Apple Watch, Samsung Gear S/Gear 2, Android Wear, Sony SmartEyeglass
- **Other**: iPod nano UI(작은 화면 인터페이스 참고), Google Cast, **Designing Interfaces** 웹사이트(Jenifer Tidwell의 94가지 패턴)

**초기 사례(2010년)**: pxd 블로그에도 이런 가이드라인 학습의 초기 사례가 있다. 안드로이드 개발자 사이트(developer.android.com)의 UI Guidelines 카테고리를 소개한 2010년 글은, 가이드라인이 **Icon Design Guidelines**, **Widget Design Guidelines**, **Activity and Task Design Guidelines**, **Menu Design Guidelines** 네 섹션으로 구성되어 있다고 정리했다. 특히 **Activity and Task Design Guidelines**는 안드로이드 UI의 기본 구성 단위인 **'Activity'** 개념을 규정하고 이를 재사용해 기능을 조립하는 방법을 설명한다는 점에서, 아이콘·위젯 같은 GUI 요소를 다루는 다른 세 섹션과 결이 다르다. 글쓴이는 이를 애플 HIG와 비교해보고 싶다는 소회를 남겼는데, 이는 '여러 가이드라인을 비교하며 활용하기' 단계가 실무자에게 자연스럽게 요구되는 학습 동기임을 보여주는 사례다.

**UI 패턴 참고 리소스**: UI 기획에서 패턴과 원칙을 이해하는 것은 건축가가 구조를 이해하는 것과 같이 기본적이고 중요하다. **UI 패턴**은 일반적인 디자인 문제에 대한 광범위한 해결 방안을 제공한다. 온라인에서 참고할 수 있는 주요 리소스로는 Mobile UI design patterns(sixrevisions.com), 모바일 앱 UI 패턴 사이트 모음, 모바일/웹 UI 패턴·쇼케이스·가이드라인 모음 등이 있다. **Designing Interfaces**(Jenifer Tidwell) 웹사이트는 94가지 인터페이스 패턴을 체계적으로 정리한 대표적 참고 자료다.

**Apple Human Interface Guidelines의 역사**: Apple HIG는 1985년 Addison-Wesley와 공동 출판을 시작한 이래, 맥 OS의 진화와 함께 꾸준히 개정된 가이드라인 계보의 교과서다. 이재용의 정리에 따르면, 총 다섯 시기로 구분된다.

**1985년판 HIG: The Apple Desktop Interface**는 현존하는 가장 이른 버전(pxd 도서관 소장본은 1987년 11월 판)이다. 제1장 '철학'에서 *"People aren't trying to use computers — they're trying to get their jobs done"*이라는 사용자 관점을 천명하고, **Metaphors, Direct Manipulation, See-and-point, Consistency, WYSIWYG, User Control, Feedback and Dialog, Forgiveness, Perceived Stability, Aesthetic Integrity** 10가지 원칙을 제시했다. 프로그래머를 위한 원칙(Modelessness, Event Loop 등)을 별도로 두었고, User Testing과 장애인 고려도 포함했다.

**1992년판 Macintosh Human Interface Guidelines**는 오늘날 "가이드라인의 교과서"로 불리는 버전이다. System 7 출시와 PowerPC 전환 시기에 나왔으며, 이전 10개 원칙에 Modelessness를 추가해 11개가 되었다. 이 판에서 처음으로 **"사용자의 80%만을 위해 디자인하라"** 원칙이 등장한다 — 나머지 20%까지 만족시키려는 순간 단순성이 무너진다는 주장이다. 전반부에 사용자 관찰 10단계, 복잡성 대처법, 시장 요구 대응법 등 실무 지식이 풍부하게 담겼다.

**2000년판 Apple Human Interface Guidelines**는 Mac OS X(2001년 3월 정식 출시)를 위한 버전으로, 'Aqua Layout Guidelines'에서 시작해 현재 이름이 되었다. 이 판부터 책 형태를 벗어나 온라인으로 제공된다. 처음으로 **'Experience'** 개념을 사용하며 'The Macintosh Experience'로서 포장·설치까지 일관성을 요구했다. OK-Cancel 버튼 배치 로직 등 상세 규정은 이 시기부터 대거 줄었다.

**2006년판**에는 '좋은 소프트웨어의 특징(Characteristics of Great Software)' 항목이 추가되어 High Performance, Ease of Use, Attractive Appearance, Reliability, Adaptability, Interoperability, Mobility 7가지를 제시했다. 디자인 원칙에 **Reflect the User's Mental Model**과 **Explicit and Implied Actions**이 추가되어 12개가 되었다. 2008년 1월판부터 표지에 파란색으로 **'User Experience'** 라는 표현이 처음 들어갔다.

**2011년판**은 트랙패드 제스처(핀치, Three-finger Swipe, Four-finger Swipe 등)를 사용자 입력 범주로 추가한 것이 특징이다. Apple HIG는 단순한 운영체제 규칙집을 넘어, 당대 UI 이론서가 부족했던 시절 **실무 교과서** 역할을 했으며, 오늘날에도 Mac/iOS에서 개발하지 않는 디자이너에게도 일독을 권하는 문헌이다.

**왜 어떤 가이드라인은 실패하는가**: 이재용은 Apple HIG·Windows·ISO 표준을 다룬 3부작에 이어, Jakob Nielsen 10 Heuristics부터 Apple Mac OS·Windows 2000·SKT NATE·KTF·Google·Facebook·네이버·현대카드에 이르는 다양한 회사의 디자인 원칙을 비교했다. 표현만 다를 뿐 대부분 **닐슨의 휴리스틱을 순서만 바꿔 재구성**한 것에 가까워, 독자들이 무시하기 쉬운 뻔한 철학으로 남는다는 것이 문제다. UIE의 **Jared Spool**은 이런 통념과 달리 Windows 7 가이드라인을 차별화된 사례로 꼽으며, 위대한 가이드라인의 조건으로 "연구에서 직접 추출됐는가", "대부분의 경우 '아니다'라고 판단할 근거를 주는가", "경쟁자와 차별화되는가", "나중에 반대로도 적용할 수 있는가", "현재 프로젝트로 평가 가능한가", "지속적으로 의미를 검증하는가" 6가지를 제시했다.

가이드라인의 성패를 가르는 것은 원칙의 문구가 아니라 **권위 — 절차적 정당성에 근거한 영향력**이다. 흔히 UI 전담팀이 외부 가이드라인을 짜깁기한 뒤 임원을 설득해 권력으로 밀어붙이는 방식(특히 한국에서는 실무 경험 없는 대학원생이 초안을 만들고 교수가 검증하는 방식)으로 만들어지는데, 이런 가이드라인은 현업의 반발을 시늉으로만 무마시키고 임원 교체와 함께 소멸한다. 성공하는 가이드라인은 세 가지 조건을 갖춘다. 첫째, **구성원의 합의와 반복된 협업·토론을 통해 직접 쓴 철학**이어야 한다(Nokia는 표준 문서 작성을 최대한 미루다가, 같은 질문에 반복 답하게 되자 시니어 디자이너들이 원칙을 정리한 사례). 둘째, **실무 경력자가 실패 사례로부터 정밀하게 좁힌 원칙**이어야 한다(Windows 7 가이드라인은 비스타 실패를 리서치해 도출됨). 셋째, **성공 사례를 먼저 만들고 그 결과물을 통해 영향력을 전파**해야 한다 — 사람들은 가이드라인의 말이 아니라 출시된 제품의 행동을 따라 배우기 때문이다.

## 핵심 내용
- UI 가이드라인 = OS·플랫폼·제조사의 인터페이스 표준 문서
- 효과적 학습 3단계: 큰 줄기 → 면밀한 내용 → 비교·활용
- 각 규정의 **근거**(심리학·트렌드·브랜드)를 함께 이해해야 적용 가능
- 가이드라인은 디자인 결정의 **설득 도구**로도 활용 가능
- 가장 효과적 학습은 **실제 프로젝트에서 가이드라인을 작성**해보는 것
- Apple HIG는 가이드라인 자체에 브랜드 정체성을 담은 대표 사례
- 2010년 안드로이드 개발자 사이트 UI Guidelines는 Icon/Widget/Activity-Task/Menu 4섹션으로 구성, 그중 Activity and Task Design Guidelines는 'Activity' 단위 자체를 규정
- **UI 패턴**: 반복되는 디자인 문제에 대한 검증된 해결 방안으로, 웹사이트·라이브러리 형태로 정리된 참고 리소스가 다수 존재
- 대부분의 회사 디자인 원칙은 **닐슨의 휴리스틱을 재배열**한 수준에 그쳐 독자에게 무시되기 쉬움
- 가이드라인의 성패는 문구가 아니라 **권위(절차적 정당성에 근거한 영향력)**에 달림
- 성공 조건 3가지: (1) 구성원이 협업·토론으로 직접 쓸 것 (2) 실무 경력자가 실패 사례로부터 정밀하게 좁힐 것 (3) 성공 사례를 먼저 만들어 전파할 것
- 사람들은 가이드라인의 말이 아니라 **출시된 결과물의 행동**을 보고 따라 함

## 관련 개념
- [[디자인 시스템]] — 가이드라인은 디자인 시스템의 토대 문서
- [[ISO UI 표준]] — 국제 표준 가이드라인의 계보
- [[UI 컴포넌트 용어]] — 가이드라인이 정의하는 컴포넌트 명칭과 분류
- [[UI와 디바이스 역사]] — Apple HIG·Windows UX의 역사적 변천
- [[Family UI]] — 공식 플랫폼 가이드라인 위에서 서비스 자체가 유지해야 할 브랜드 일관성
- [[지각심리학과 UI 설계]] — 가이드라인 규정이 왜 그래야 하는지를 설명하는 지각·인지심리학적 근거
- [[CHI 2015 학회와 HCI 연구 트렌드]] — Jeff Johnson의 "Designing with the Mind in Mind" 강연이 다루는 가이드라인의 심리학적 근거

## 출처
- [신입 UI 디자이너를 위한 'UI 가이드라인 바로 배우기' 지침서](https://story.pxd.co.kr/1063) — UX 가벼운 이야기
- [UI 패턴을 다룬 웹사이트 모음](https://story.pxd.co.kr/684) — 2013-04-24, 위승용 uxdragon
- [사용자의 80%만을 위해 디자인하라 - Apple Human Interface Guidelines의 역사](https://story.pxd.co.kr/400) — 2011-07-15, 이 재용
- [왜 어떤 가이드라인은 실패하는가? - 말보다 행동이 중요하다](https://story.pxd.co.kr/426) — 2011-08-25, 이 재용
- [안드로이드 UI/GUI 가이드라인](https://story.pxd.co.kr/162) — 2010-06-28, 전성진
