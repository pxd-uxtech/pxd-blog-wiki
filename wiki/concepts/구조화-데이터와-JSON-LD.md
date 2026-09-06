---
type: concept
domain: "웹 개발"
name: "구조화 데이터와 JSON-LD"
sources: ["/1910"]
updated: "2026-09-07"
---
# 구조화 데이터와 JSON-LD

**구조화 데이터(Structured Data)**를 마크업하는 방식은 JSON-LD·Microdata·RDFa 세 가지가 있는데, 이 중 Google이 공식 권장하는 형식은 **JSON-LD**다. `<script type="application/ld+json">` 태그 안에 HTML 구조와 완전히 분리해 넣기 때문에 기존 HTML을 건드리지 않고 추가할 수 있는 반면, Microdata·RDFa는 HTML 속성에 마크업을 직접 섞어야 해 유지보수가 어렵다. 구조화 데이터에 대해 먼저 정확히 짚어야 할 점은 **검색 순위를 직접 올려주지 않는다**는 것이다. 역할은 검색 결과에 별점·가격·이미지·빵부스러기 같은 **리치 결과**를 표시하는 것이고, 리치 결과가 클릭률(CTR)을 높여 간접적으로 SEO에 기여하는 구조다(Nestlé 사례에서 리치 결과 노출 페이지가 일반 결과 대비 82% 높은 CTR을 기록). 2026년 5월 구글이 발표한 AI 검색 최적화 공식 가이드도 "구조화 데이터는 생성형 AI 검색에 필수는 아니지만, 전체 SEO 전략의 일부로서 계속 사용하는 것이 좋다"고 명시한다 — "AI를 위한 특별한 마크업"이 아니라 "검색 전체를 위한 기본기"로 접근하는 것이 정확하다.

주요 스키마 타입은 용도별로 나뉜다. 블로그·뉴스 페이지의 기본은 **Article**로, 필수 속성은 `headline`·`datePublished`·`author`이며 `image`는 필수는 아니지만 큰 이미지 리치 결과를 위해 권장된다. 실무에서는 `headline`을 110자 이내로 유지하고(Google 리치 결과 표시 제한), `dateModified`를 반드시 포함하며(콘텐츠 최신성과 직결), `author.url`을 넣어 저자를 확인 가능하게 하는 것이 **E-E-A-T**(경험·전문성·권위성·신뢰성) 관점에서 권장된다. 이커머스 상품 페이지에는 **Product**가 핵심이며 `offers`가 없으면 가격·재고 리치 결과 자체가 표시되지 않고, `aggregateRating`은 실제 리뷰 데이터를 기반으로 해야 한다(구글 가이드는 이커머스 사이트에 Merchant Center 피드·Google Business Profile 정비도 함께 권장한다). **BreadcrumbList**는 검색 결과에 URL 대신 "홈 > 카테고리 > 하위 카테고리" 경로를 표시해 사이트 구조를 전달한다. **HowTo**는 2023년 8월 모바일, 이후 데스크톱에서도 리치 결과가 제거됐지만 스키마 자체는 AI가 절차 구조를 이해하는 데 참고될 수 있다. **Organization**·**WebSite**는 페이지 단위가 아니라 사이트 전체를 대표하는 스키마로 홈페이지에 한 번만 넣으면 된다.

**FAQPage**는 SEO와 GEO를 따로 보면 판단이 갈리는 대표 사례다. 2019년 출시된 FAQ 스키마는 2023년 8월 정부·의료 등 고신뢰 사이트만 남기고 축소됐고, 2026년 5월 7일 SERP 리치 결과가 완전 종료됐으며 6월 Rich Results Test 검증, 8월 Search Console 리포트·API 지원까지 순차 종료될 예정이다. 그런데 스키마 자체는 죽지 않았다 — AI 검색 서비스들이 Q&A를 추출할 때 FAQPage 구조화 데이터를 파싱한다는 분석이 있어, SEO 관점의 "리치 결과 없으니 빼도 된다"와 GEO 관점의 "AI 인용 신호로서 가치가 오히려 오른다"가 같은 스키마를 두고 반대 결론을 낸다. 실무 권장은 기존 FAQPage 마크업은 유지하고, Q&A 콘텐츠가 있다면 리치 결과가 아니라 AI 인용 신호를 목적으로 신규 구현하는 것이다.

배포 전 검증은 필수다. 페이지에 없는 정보를 JSON-LD에만 넣거나(가이드라인 위반), Article의 `author`·Product의 `offers` 같은 필수 속성이 누락되면 부분 구현은 효과가 없으며, 쉼표 누락이나 스마트 따옴표 혼입 같은 JSON 문법 오류는 전체 JSON-LD를 무효화시킨다. Google Rich Results Test(리치 결과 적격 확인), Schema.org Validator(JSON-LD 문법 검증), Google Search Console(배포 후 실제 노출·오류 모니터링)로 검증하는 습관이 필요하다.

## 핵심 내용
- 구조화 데이터 3형식(JSON-LD·Microdata·RDFa) 중 **JSON-LD**가 구글 공식 권장 — HTML과 분리된 `<script>` 태그로 유지보수 용이
- 구조화 데이터는 **검색 순위를 직접 올리지 않음** — 리치 결과 → CTR 상승 → 간접적 SEO 효과(Nestlé 사례 CTR +82%)
- **Article**: `headline`·`datePublished`·`author` 필수, `headline` 110자 이내, `dateModified` 필수 권장, `author.url`은 E-E-A-T 신호
- **Product**: `offers` 필수(없으면 리치 결과 미표시), `aggregateRating`은 실제 리뷰 데이터 기반
- **BreadcrumbList**(사이트 계층 전달), **HowTo**(리치 결과 종료, 스키마는 AI 이해에 참고 가능), **Organization·WebSite**(사이트 전체, 홈페이지 1회)
- **FAQPage**: 2026-05-07 리치 결과 완전 종료되었지만 AI의 Q&A 추출 신호로는 가치 상승 — SEO·GEO를 함께 봐야 정확한 판단
- 흔한 오류: 페이지 미노출 정보 마크업, 필수 속성 누락, JSON 문법 오류 — Rich Results Test·Schema.org Validator·Search Console로 검증

## 관련 개념
- [[기술적 SEO와 크롤링 최적화]] — 크롤링·인덱싱 이후 페이지 이해를 돕는 구조화 데이터의 위치
- [[AI 인용 최적화 콘텐츠 구조]] — 구조화 데이터 외에 헤딩·문단·FAQ 구조가 AI 인용에 미치는 영향을 다루는 인접 주제
- [[코어 웹 바이탈과 SEO]] — 구조화 데이터·성능 지표 모두 SEO 전체 전략을 구성하는 신호
- [[GEONIQ 산업별 AI 검색 인사이트 리포트]] — 구조화 데이터·Answerability 등 진단 기준이 실제 업종별 사이트에 적용된 사례

## 출처
- [검색엔진과 AI가 우리 페이지를 더 정확히 이해하도록 돕는 방법](https://story.pxd.co.kr/1910) — 2026-08-24, Seulbi Lee
