---
type: concept
domain: "기술 구현"
name: "Cheerio와 Node.js 웹 스크래핑"
sources: ["/1736"]
updated: "2026-07-15"
---
# Cheerio와 Node.js 웹 스크래핑

**Cheerio**는 Node.js 환경에서 HTML 문서를 파싱하고 원하는 요소를 선택·추출할 수 있게 해주는 웹 스크래핑용 모듈이다. `document.querySelector()`처럼 HTML 요소를 골라낼 수 있으며, jQuery와 유사한 방식으로 DOM을 탐색하기 때문에 jQuery 경험이 있는 개발자가 특히 쉽게 적응할 수 있다.

일반적인 사용 흐름은 HTTP 클라이언트로 대상 페이지의 HTML을 가져온 뒤 Cheerio로 파싱하는 두 단계로 이루어진다. **axios** 같은 라이브러리로 `response.data`(HTML 문자열)를 받아오고, 이를 `cheerio.load()`에 넘기면 CSS 선택자로 DOM을 탐색할 수 있는 `$` 객체가 만들어진다. 이후 `.find()`, `.text()`, `.attr()`, `.prop()` 등의 메서드를 조합해 원하는 텍스트, 링크, 배경 이미지 URL 등을 추출한다. 예를 들어 리스트형 요소를 `.slice()`로 개수를 제한하고 `.map().get()`으로 순회하며 제목·링크·썸네일 데이터를 객체 배열로 변환하는 패턴이 대표적이다.

Cheerio는 실제 브라우저 렌더링 없이 정적 HTML을 빠르게 파싱하는 데 특화되어 있어, 다른 웹사이트의 특정 정보 영역(목록, 카드, 게시글 등)을 정기적으로 데이터화해야 하는 작업에 적합하다.

## 핵심 내용
- **Cheerio**: Node.js용 HTML 파싱·스크래핑 라이브러리, jQuery와 유사한 API
- 사용 흐름: HTTP 요청(axios 등)으로 HTML 획득 → `cheerio.load()`로 파싱 → CSS 선택자로 요소 탐색
- 주요 메서드: `.find()`, `.text()`, `.attr()`, `.prop()`, `.map().get()`
- jQuery 경험자에게 친숙한 DOM 탐색 방식
- 정적 페이지의 특정 정보 영역을 반복적으로 수집하는 작업에 적합

## 관련 개념
- [[블로그 검색 노출과 크롤링 정책]] — 스크래핑 대상이 되는 웹사이트 입장에서의 크롤링 정책
- [[슬랙봇 개발]] — Node.js 기반 자동화 도구 개발이라는 유사한 기술 구현 맥락

## 출처
- [cheerio](https://story.pxd.co.kr/1736) — 2023-12-14, crsmym
