---
type: concept
domain: "디자인 시스템"
name: "UI 가이드라인"
sources: ["/1063", "/684", "/400", "/426", "/162", "/992", "/469", "/408", "/968"]
updated: "2026-08-21"
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

**공식 가이드라인으로의 진화 — Android Design(2011)**: 2010년 developer.android.com의 UI Guidelines가 Icon/Widget/Activity-Task/Menu 섹션별로 흩어져 있던 것과 달리, 구글은 2011년 안드로이드 4.0 아이스크림 샌드위치(ICS) 출시에 맞춰 **Android Design**이라는 정식 명칭의 통합 스타일 가이드를 새로 공개했다. 이 가이드는 스마트폰·태블릿 모두에 최적화된 UI를 만들도록 돕는다는 목표 아래 **Style**(디바이스와 디스플레이, 테마, 타이포그래피, 색상, 문체 등), **Patterns**(내비게이션, 선택, 알림, 스와이프 뷰, 호환성 등), **Building Blocks**(텍스트 필드, 스크롤, 버튼, 다이얼로그, 탭, 리스트 등) 세 영역으로 재구성됐다는 점에서, 산발적 카테고리 나열이던 이전 버전보다 진일보한 문서 구조를 보여준다. 국내에는 한글 번역본(klutzy.github.com/android-design-ko)도 함께 소개됐으며, 구글이 이 가이드를 정기적으로 업데이트하겠다고 밝힌 것은 안드로이드 UI 가이드라인이 파편적 카테고리 문서에서 지속 관리되는 **공식 표준 문서**로 자리잡는 전환점이었다.

**UI 패턴 참고 리소스**: UI 기획에서 패턴과 원칙을 이해하는 것은 건축가가 구조를 이해하는 것과 같이 기본적이고 중요하다. **UI 패턴**은 일반적인 디자인 문제에 대한 광범위한 해결 방안을 제공한다. 온라인에서 참고할 수 있는 주요 리소스로는 Mobile UI design patterns(sixrevisions.com), 모바일 앱 UI 패턴 사이트 모음, 모바일/웹 UI 패턴·쇼케이스·가이드라인 모음 등이 있다. **Designing Interfaces**(Jenifer Tidwell) 웹사이트는 94가지 인터페이스 패턴을 체계적으로 정리한 대표적 참고 자료다.

**Apple Human Interface Guidelines의 역사**: Apple HIG는 1985년 Addison-Wesley와 공동 출판을 시작한 이래, 맥 OS의 진화와 함께 꾸준히 개정된 가이드라인 계보의 교과서다. 이재용의 정리에 따르면, 총 다섯 시기로 구분된다.

**1985년판 HIG: The Apple Desktop Interface**는 현존하는 가장 이른 버전(pxd 도서관 소장본은 1987년 11월 판)이다. 제1장 '철학'에서 *"People aren't trying to use computers — they're trying to get their jobs done"*이라는 사용자 관점을 천명하고, **Metaphors, Direct Manipulation, See-and-point, Consistency, WYSIWYG, User Control, Feedback and Dialog, Forgiveness, Perceived Stability, Aesthetic Integrity** 10가지 원칙을 제시했다. 프로그래머를 위한 원칙(Modelessness, Event Loop 등)을 별도로 두었고, User Testing과 장애인 고려도 포함했다.

**1992년판 Macintosh Human Interface Guidelines**는 오늘날 "가이드라인의 교과서"로 불리는 버전이다. System 7 출시와 PowerPC 전환 시기에 나왔으며, 이전 10개 원칙에 Modelessness를 추가해 11개가 되었다. 이 판에서 처음으로 **"사용자의 80%만을 위해 디자인하라"** 원칙이 등장한다 — 나머지 20%까지 만족시키려는 순간 단순성이 무너진다는 주장이다. 전반부에 사용자 관찰 10단계, 복잡성 대처법, 시장 요구 대응법 등 실무 지식이 풍부하게 담겼다.

**2000년판 Apple Human Interface Guidelines**는 Mac OS X(2001년 3월 정식 출시)를 위한 버전으로, 'Aqua Layout Guidelines'에서 시작해 현재 이름이 되었다. 이 판부터 책 형태를 벗어나 온라인으로 제공된다. 처음으로 **'Experience'** 개념을 사용하며 'The Macintosh Experience'로서 포장·설치까지 일관성을 요구했다. OK-Cancel 버튼 배치 로직 등 상세 규정은 이 시기부터 대거 줄었다.

**2006년판**에는 '좋은 소프트웨어의 특징(Characteristics of Great Software)' 항목이 추가되어 High Performance, Ease of Use, Attractive Appearance, Reliability, Adaptability, Interoperability, Mobility 7가지를 제시했다. 디자인 원칙에 **Reflect the User's Mental Model**과 **Explicit and Implied Actions**이 추가되어 12개가 되었다. 2008년 1월판부터 표지에 파란색으로 **'User Experience'** 라는 표현이 처음 들어갔다.

**2011년판**은 트랙패드 제스처(핀치, Three-finger Swipe, Four-finger Swipe 등)를 사용자 입력 범주로 추가한 것이 특징이다. Apple HIG는 단순한 운영체제 규칙집을 넘어, 당대 UI 이론서가 부족했던 시절 **실무 교과서** 역할을 했으며, 오늘날에도 Mac/iOS에서 개발하지 않는 디자이너에게도 일독을 권하는 문헌이다.

**Windows User Experience Guidelines의 역사**: 이재용이 Apple HIG에 이어 정리한 시리즈 2부다. Windows 1.0(1985년 11월)과 2.0(1987년 12월)은 널리 쓰이지 못했고, 3.0(1990)과 3.1(1992년 3월)에 이르러서야 첫 성공을 거뒀다. 마이크로소프트는 이 흐름을 따라 총 5차례에 걸쳐 가이드라인 문헌을 갱신했다.

**Windows 3.1: The Windows Interface: An Application Design Guide**(Microsoft programming series, 1987년 초판, pxd 도서관은 1992년 4월판 소장)는 **User Control, Directness, Consistency, Clarity, Aesthetics, Feedback, Forgiveness, Awareness of Human Strengths and Limitations** 8가지 원칙을 제시했다. p136에서는 'OK'와 'Cancel' 버튼의 배치 순서와, 다이얼로그 맨 끝에 'Help' 버튼을 두는 이유를 한 페이지 분량으로 설명한다.

**Windows 95: The Windows Interface Guidelines for Software Design**(1994년 1월 2판, pxd 도서관은 1995년판 소장)는 OLE 도입과 함께 **'application-centered'에서 'data-centered interface'**로의 전환을 강조하며, 프로그램을 만드는 개발자·디자이너에게 자신의 제품을 다시 생각해보라고 권고했다. 원칙은 7가지(User in Control, Directness, Consistency, Forgiveness, Feedback, Aesthetics, Simplicity)로 줄었다 — Clarity가 Simplicity로 대체되고, 지나치게 포괄적이었던 Awareness of Human Strengths and Limitations는 삭제됐다.

**Windows 98 & 2000: Microsoft Windows User Experience**(Microsoft Professional Editions, 1999년 10월 출판, pxd 도서관 소장)는 제목에 처음으로 **'User Experience'**라는 표현을 사용한 가이드라인이다 — 애플 HIG 표지에 'User Experience'가 등장한 2008년보다 9년 앞선다. 원칙은 앞선 7개를 그대로 유지했다.

**Windows Me·XP·Vista**: 이후 별도의 단행본 출판은 중단됐다. Windows User Experience Guidelines for Windows XP and Windows 2000(2007년판, 실제 내용은 2006년 출시된 Vista에 맞춰짐)과, 정식 출시 전 사전 배포한 Windows Vista UX Guide(2006년 12월 최종 수정)로 이어졌다. Windows Me(2000년 9월)·XP(2001년)·Vista(2006년 11월) 순으로 출시됐다.

**Windows 7: Windows User Experience Interaction Guidelines (UX Guide) for Windows 7 and Windows Vista**는 2009년 7월 출시된 Windows 7과 함께 지속적으로 개정되는 온라인 문서(MSDN)로 정착해, 더 이상 특정 시점의 '판본'으로 고정되지 않았다. 이재용은 가이드라인 본문뿐 아니라 제작 과정과 Design Principle을 다룬 공식 소개 비디오를 함께 볼 것을 권했는데, 비스타 시절의 혹평을 딛고 이뤄낸 질적 도약이 이 비디오에 잘 드러난다고 평가했다.

**왜 어떤 가이드라인은 실패하는가**: 이재용은 Apple HIG·Windows·ISO 표준을 다룬 3부작에 이어, Jakob Nielsen 10 Heuristics부터 Apple Mac OS·Windows 2000·SKT NATE·KTF·Google·Facebook·네이버·현대카드에 이르는 다양한 회사의 디자인 원칙을 비교했다. 표현만 다를 뿐 대부분 **닐슨의 휴리스틱을 순서만 바꿔 재구성**한 것에 가까워, 독자들이 무시하기 쉬운 뻔한 철학으로 남는다는 것이 문제다. UIE의 **Jared Spool**은 이런 통념과 달리 Windows 7 가이드라인을 차별화된 사례로 꼽으며, 위대한 가이드라인의 조건으로 "연구에서 직접 추출됐는가", "대부분의 경우 '아니다'라고 판단할 근거를 주는가", "경쟁자와 차별화되는가", "나중에 반대로도 적용할 수 있는가", "현재 프로젝트로 평가 가능한가", "지속적으로 의미를 검증하는가" 6가지를 제시했다.

가이드라인의 성패를 가르는 것은 원칙의 문구가 아니라 **권위 — 절차적 정당성에 근거한 영향력**이다. 흔히 UI 전담팀이 외부 가이드라인을 짜깁기한 뒤 임원을 설득해 권력으로 밀어붙이는 방식(특히 한국에서는 실무 경험 없는 대학원생이 초안을 만들고 교수가 검증하는 방식)으로 만들어지는데, 이런 가이드라인은 현업의 반발을 시늉으로만 무마시키고 임원 교체와 함께 소멸한다. 성공하는 가이드라인은 세 가지 조건을 갖춘다. 첫째, **구성원의 합의와 반복된 협업·토론을 통해 직접 쓴 철학**이어야 한다(Nokia는 표준 문서 작성을 최대한 미루다가, 같은 질문에 반복 답하게 되자 시니어 디자이너들이 원칙을 정리한 사례). 둘째, **실무 경력자가 실패 사례로부터 정밀하게 좁힌 원칙**이어야 한다(Windows 7 가이드라인은 비스타 실패를 리서치해 도출됨). 셋째, **성공 사례를 먼저 만들고 그 결과물을 통해 영향력을 전파**해야 한다 — 사람들은 가이드라인의 말이 아니라 출시된 제품의 행동을 따라 배우기 때문이다.

**WebTV Design Guide — 최초의 TV UI/GUI 디자인 가이드(1999)**: 이재용이 정리한 바에 따르면, 1995년 Steve Perlman 등이 설립한 **WebTV**(이후 마이크로소프트에 인수돼 MSN-TV로 개명, 2013년 9월 서비스 종료)는 셋톱박스를 통해 기존 브라운관 TV에서 인터넷을 이용할 수 있게 한 서비스로, TV 화면에서 정보가 어떻게 보여야 하는가에 대한 최초의 본격적 연구를 수행했다. 1996년까지 거의 매주 8명 정도의 사용자를 대상으로 사용성 평가를 진행할 만큼 깊이 있게 연구했고, 이 과정에서 'TV UI 디자이너'라는 새 직업군을 만들어냈다. 기존 TV 제조사와 달리 외부에서 제작된 웹 콘텐츠가 자사 셋톱박스에서도 잘 보이도록 보장해야 했기 때문에, WebTV는 연구 성과를 외부에 공개하는 방식을 택했고, 그 결과 1999년경 자사 홈페이지(webtv.net)를 통해 **최초의 TV UI/GUI 디자인 가이드**를 배포했다(서비스 종료로 현재는 웹 아카이브를 통해서만 열람 가능). 이 가이드는 CRT 디스플레이의 물리적 한계를 고려해 화면 크기를 544×372로 규정하고, 16포인트 이상의 글자 크기, 완전한 흰색 배경 지양, 붉은색 사용 자제, 인터레이스 방식으로 인한 한 픽셀 굵기 수평선의 떨림 문제 등을 규정했다. WebTV는 약 100만 가구가 구매해 월 40시간 이상 사용했는데, 사용자 대부분이 이전에 인터넷을 써본 적 없는 계층이었다는 점에서, TV 앞이라는 특수한 사용 맥락과 CRT 디스플레이 특성에 대한 깊은 이해가 이후 Interactive TV·IPTV·스마트 TV로 이어지는 TV UX 연구의 초석이 되었다.

**HCI KOREA 2015 발표 사례 — 스마트TV 표준 가이드라인 작성법**: pxd의 정유리·김동후는 2014년 12월 HCI KOREA 2015 학회에서 '성공적인 스마트TV 표준 가이드라인 만들기' 사례를 발표했다. 이들은 가이드라인 제작 현장의 반복적인 실패 원인을, 절대적 권위를 가진 하나의 문서가 각 부서에 전달되는 이상적 구조 대신 유관 부서가 독립적으로 규정한 원칙들을 짜깁기하는 **시스템적 문제**와, 실무 경험 없는 인력이 제작해 완성도가 떨어지거나 '가이드라인을 보는 사람'을 배려하지 않아 사용성이 떨어지는 **환경적 문제**로 구분했다. 스마트TV는 불특정 다수를 대상으로 하고 시청 거리와 리모컨 같은 간접 조작 방식까지 고려해야 해 사용자 경험의 폭이 특히 넓은 디바이스이므로, 더 넓은 범위에서 표준을 정의해야 한다는 점도 짚었다.

이들이 제시한 성공적인 가이드라인 작성의 핵심은 **Context·Reader·End User** 세 가지 고려사항이다. Context는 가이드라인이 작성되는 맥락 — 프로젝트 배경, 정책 결정 과정의 히스토리, 디바이스 이용 환경에 대한 이해를 뜻한다. Reader는 가이드라인을 실제로 활용할 사람에 대한 배려로, 너무 추상적이지도 너무 구체적이지도 않은 중간 레벨로 작성해야 한다는 원칙이다. End User는 가이드라인이 궁극적으로 최종 서비스 사용자의 행복을 위한 '개발 매뉴얼'이라는 관점으로, 사용자 중심 정책과 인지심리학적 이해가 뒷받침되어야 한다는 것이다. 이 세 가지는 앞서 정리한 "성공하는 가이드라인의 3조건"과 같은 방향에서, 가이드라인을 쓰기 전에 무엇을 먼저 이해해야 하는지를 보여주는 실무 체크리스트로 볼 수 있다.

## 핵심 내용
- UI 가이드라인 = OS·플랫폼·제조사의 인터페이스 표준 문서
- 효과적 학습 3단계: 큰 줄기 → 면밀한 내용 → 비교·활용
- 각 규정의 **근거**(심리학·트렌드·브랜드)를 함께 이해해야 적용 가능
- 가이드라인은 디자인 결정의 **설득 도구**로도 활용 가능
- 가장 효과적 학습은 **실제 프로젝트에서 가이드라인을 작성**해보는 것
- Apple HIG는 가이드라인 자체에 브랜드 정체성을 담은 대표 사례
- **Windows UX 가이드라인**은 총 5차례 갱신됐다(3.1→95→98·2000→XP·Vista→7). 디자인 원칙은 8개(Windows 3.1)에서 7개(Windows 95 이후)로 줄었고, **Microsoft Windows User Experience**(1999)는 제목에 'User Experience'를 쓴 최초의 가이드라인으로 Apple HIG(2008)보다 9년 앞섬
- Windows 7부터는 단행본 출판 대신 **MSDN 온라인 문서**로 지속 개정되는 방식으로 전환됨
- 2010년 안드로이드 개발자 사이트 UI Guidelines는 Icon/Widget/Activity-Task/Menu 4섹션으로 구성, 그중 Activity and Task Design Guidelines는 'Activity' 단위 자체를 규정
- 2011년 구글이 안드로이드 4.0(ICS) 출시에 맞춰 공개한 **Android Design**은 Style·Patterns·Building Blocks 3영역으로 재구성된 정식 통합 가이드로, 이후 정기 업데이트되는 공식 표준 문서로 자리잡음
- **UI 패턴**: 반복되는 디자인 문제에 대한 검증된 해결 방안으로, 웹사이트·라이브러리 형태로 정리된 참고 리소스가 다수 존재
- **WebTV**(1995~2013): 셋톱박스로 브라운관 TV에서 인터넷을 쓰게 한 서비스, 1999년경 최초의 TV UI/GUI 디자인 가이드(544×372 화면, 16pt 이상 글자, CRT 특성 고려)를 공개해 이후 스마트TV 가이드라인의 계보를 낳음
- 대부분의 회사 디자인 원칙은 **닐슨의 휴리스틱을 재배열**한 수준에 그쳐 독자에게 무시되기 쉬움
- 가이드라인의 성패는 문구가 아니라 **권위(절차적 정당성에 근거한 영향력)**에 달림
- 성공 조건 3가지: (1) 구성원이 협업·토론으로 직접 쓸 것 (2) 실무 경력자가 실패 사례로부터 정밀하게 좁힐 것 (3) 성공 사례를 먼저 만들어 전파할 것
- 사람들은 가이드라인의 말이 아니라 **출시된 결과물의 행동**을 보고 따라 함
- HCI KOREA 2015(정유리·김동후): 가이드라인 제작 실패 원인을 **시스템적 문제**(부서별 규정 짜깁기)와 **환경적 문제**(비전문가 제작·독자 배려 부족)로 구분
- 성공적인 가이드라인 작성의 3요소: **Context**(작성 맥락 이해)·**Reader**(가이드라인 사용자 배려)·**End User**(최종 사용자 행복)

## 관련 개념
- [[디자인 시스템]] — 가이드라인은 디자인 시스템의 토대 문서
- [[ISO UI 표준]] — 국제 표준 가이드라인의 계보
- [[UI 컴포넌트 용어]] — 가이드라인이 정의하는 컴포넌트 명칭과 분류
- [[UI와 디바이스 역사]] — Apple HIG·Windows UX의 역사적 변천
- [[Family UI]] — 공식 플랫폼 가이드라인 위에서 서비스 자체가 유지해야 할 브랜드 일관성
- [[지각심리학과 UI 설계]] — 가이드라인 규정이 왜 그래야 하는지를 설명하는 지각·인지심리학적 근거
- [[CHI 2015 학회와 HCI 연구 트렌드]] — Jeff Johnson의 "Designing with the Mind in Mind" 강연이 다루는 가이드라인의 심리학적 근거
- [[대한민국 HCI-UI-UX 역사]] — 스마트TV 표준 가이드라인 발표가 이루어진 HCI KOREA 2015 학술대회 및 pxd 발표 이력 전체 맥락

## 출처
- [신입 UI 디자이너를 위한 'UI 가이드라인 바로 배우기' 지침서](https://story.pxd.co.kr/1063) — UX 가벼운 이야기
- [UI 패턴을 다룬 웹사이트 모음](https://story.pxd.co.kr/684) — 2013-04-24, 위승용 uxdragon
- [사용자의 80%만을 위해 디자인하라 - Apple Human Interface Guidelines의 역사](https://story.pxd.co.kr/400) — 2011-07-15, 이 재용
- [마침내 혼란을 극복한 Windows 7 - Windows User Experience Interaction Guidelines의 역사](https://story.pxd.co.kr/408) — 2011-07-27, 이 재용
- [왜 어떤 가이드라인은 실패하는가? - 말보다 행동이 중요하다](https://story.pxd.co.kr/426) — 2011-08-25, 이 재용
- [안드로이드 UI/GUI 가이드라인](https://story.pxd.co.kr/162) — 2010-06-28, 전성진
- [[HCI KOREA 2015 후기 1/2] 성공적인 스마트TV 표준 가이드라인 만들기 발표 후기](https://story.pxd.co.kr/992) — 2015-01-15, 알 수 없는 사용자
- [안드로이드 디자인 : Android 4.0 ICS 디자인 가이드](https://story.pxd.co.kr/469) — 2012-02-17, 알 수 없는 사용자
- [WebTV Design Guide](https://story.pxd.co.kr/968) — 2014-12-23, 이 재용
