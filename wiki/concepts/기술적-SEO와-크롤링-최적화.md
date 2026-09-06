---
type: concept
domain: "웹 개발"
name: "기술적 SEO와 크롤링 최적화"
sources: ["/1899"]
updated: "2026-09-07"
---
# 기술적 SEO와 크롤링 최적화

검색엔진이 검색 결과를 보여주기까지는 **크롤링(Crawling) → 인덱싱(Indexing) → 랭킹(Ranking)** 세 단계를 거치며, 크롤링이 안 되면 인덱싱도 랭킹도 진행되지 않는다. 아무리 좋은 콘텐츠라도 크롤러가 접근하지 못하면 검색 결과에 나타나지 않으므로, 기술적 SEO의 출발점은 항상 "크롤러가 사이트에 제대로 접근할 수 있는가"다. 실제로 콘텐츠는 멀쩡한데 크롤러가 아예 접근하지 못하는 사이트가 대기업 사이트를 포함해 의외로 많다.

**robots.txt**는 크롤러가 가장 먼저 확인하는 파일로, 어디를 탐색해도 되는지 알려준다. `Disallow: /`로 전체를 차단해버린 채 운영에 배포해 몇 달간 검색 노출이 0이었던 사례처럼, 개발 환경 설정이 실수로 운영에 반영되는 것이 가장 치명적인 실수다. **sitemap**은 반대로 "우리 사이트에 어떤 페이지가 있는지"를 목록으로 알려주는 역할을 하는데, robots.txt에 sitemap 경로를 명시하지 않거나, sitemap에 등록된 URL이 실제로는 404/500을 반환하거나, 모든 URL의 `lastmod`를 빌드 시점의 오늘 날짜로 일괄 채워 실제 수정 시점을 왜곡하는 것이 흔한 실수다([[Next.js 사이트맵 자동화]] 참고). 크롤러는 `<a href>` 기반 링크를 가장 안정적으로 탐색하므로, `onClick` 기반 커스텀 라우팅으로만 구현된 내비게이션은 크롤러에게 인식되지 않을 수 있다.

사이트 규모가 커지면 **크롤 예산(crawl budget)** — 검색엔진이 한 사이트에 할당하는 크롤링 자원의 한계 — 관리가 중요해진다. 정렬·필터 파라미터 조합이나 세션 ID가 URL에 붙어 사실상 무한한 URL이 생성되면 크롤러가 의미 없는 URL 탐색에 자원을 낭비한다. 이때 **canonical 태그**로 표준 URL을 지정해 중복 URL을 정리하는데, canonical은 중복 정리, robots.txt는 크롤링 자체 차단으로 역할이 구분된다. 페이지가 하나뿐이어도 자기 자신을 가리키는 **self-canonical**을 설정해두는 것이 권장된다. HTTP→HTTPS, www/non-www 리다이렉트가 누락되면 같은 콘텐츠가 두 URL로 인식되어 검색 노출이 분산되고, 리다이렉트 체인이 길어지면(구글은 최대 10홉까지만 추적) 크롤링 효율이 떨어지므로 실무에서는 3~5회 이하로 유지하는 것이 안전하다. 삭제된 페이지는 대체 콘텐츠가 있으면 301, 없으면 404 대신 **410(Gone)**으로 응답해 크롤러가 재방문을 빨리 포기하게 하는 편이 크롤 예산을 아낀다.

AI 검색 시대에는 크롤러 전략이 한층 세분화된다. Googlebot은 JavaScript 렌더링을 지원하지만 렌더링에 시간과 크롤 예산이 더 든다. 반면 **GPTBot·ClaudeBot** 같은 주요 AI 크롤러는 JavaScript를 실행하지 않는다는 것이 Vercel과 MERJ의 5억 7천만 건 분석으로 확인됐다. 또한 OpenAI·Anthropic 모두 크롤러를 목적별로 분리 운영한다 — **GPTBot/ClaudeBot**은 AI 모델 학습 데이터 수집용, **OAI-SearchBot/Claude-SearchBot**은 실시간 검색 노출용, **ChatGPT-User/Claude-User**는 사용자가 직접 요청했을 때의 페이지 접근용이다. 이 구분 덕분에 "학습에는 쓰이길 원하지 않지만 AI 검색 인용은 원한다"는 선택을 robots.txt에서 봇별로 분리 설정할 수 있다. 실시간 인용 경로도 서비스마다 다른데, ChatGPT는 Bing 인덱스를 포함한 외부 소스를, Gemini는 Google 검색 색인을 직접 활용하고, Claude는 Claude-SearchBot(기반 색인 비공개), Perplexity는 자체 크롤링과 복수 검색엔진을 혼합한다. 설정 후에는 Google Search Console(URL 검사, sitemap 상태, 페이지 색인 보고서), Bing Webmaster Tools, 네이버 서치어드바이저(자체 크롤러 Yeti) 같은 도구로 실제 크롤링·색인 상태를 검증해야 한다.

## 핵심 내용
- **크롤링→인덱싱→랭킹** 3단계, 크롤링이 막히면 이후 단계가 아예 진행되지 않음
- robots.txt `Disallow: /` 전체 차단, sitemap `lastmod` 일괄 오늘 날짜 설정이 흔한 치명적 실수
- **크롤 예산**: 무한 URL 생성(필터·정렬·세션ID)이 낭비 원인, **canonical 태그**로 중복 URL 정리(robots.txt와 역할 구분)
- 리다이렉트는 3~5회 이하로 유지, 삭제 페이지는 대체 있으면 301·없으면 410(Gone)
- **AI 크롤러 분리**: 학습용(GPTBot·ClaudeBot) vs 검색노출용(OAI-SearchBot·Claude-SearchBot) vs 사용자요청용(ChatGPT-User·Claude-User) — robots.txt로 봇별 개별 제어 가능
- 주요 AI 크롤러는 JavaScript를 실행하지 않음(Vercel+MERJ 분석) → CSR 전용 사이트는 핵심 콘텐츠가 크롤러에 아예 보이지 않을 위험
- 검증 도구: Google Search Console·Bing Webmaster Tools·네이버 서치어드바이저(Yeti)

## 관련 개념
- [[Next.js 사이트맵 자동화]] — sitemap.xml·robots.txt를 빌드 파이프라인에서 자동 생성하는 실무 구현
- [[코어 웹 바이탈과 SEO]] — 크롤링·색인 이후 페이지 품질(순위 신호)을 다루는 인접 주제
- [[블로그 검색 노출과 크롤링 정책]] — opt-in/opt-out 크롤링 정책 차이로 검색 노출이 갈렸던 초기 사례
- [[AI를 위한 UI 패턴과 UX]] — GEONIQ의 AI 크롤러 접근성 진단이 이 글의 봇 분리 전략과 직접 연결
- [[CSR과 SSR 렌더링 방식]] — CSR 전용 구현이 크롤러의 콘텐츠 인식을 저해하는 이유

## 출처
- [검색엔진은 우리 사이트를 어떻게 발견할까?](https://story.pxd.co.kr/1899) — 2026-05-21, shushushu
