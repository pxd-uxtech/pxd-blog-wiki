---
type: concept
domain: "웹 개발"
name: "Next.js 사이트맵 자동화"
sources: ["/1716"]
updated: "2026-07-09"
---
# Next.js 사이트맵 자동화

**사이트맵(sitemap)**은 사이트 내 페이지·파일과 그 관계 정보를 담아 검색엔진이 사이트를 더 효율적으로 크롤링하도록 돕는 파일이다. Google은 사이트가 크고 복잡하거나, 외부 유입 링크가 적은 신규 사이트이거나, 리치 미디어(동영상·이미지) 콘텐츠가 많을 때 특히 사이트맵의 효과가 크다고 안내한다. 링크 구조가 잘 되어 있어도 검색엔진이 페이지를 찾는 것과, 그 페이지가 실제로 크롤링·색인되는 것은 별개이므로 사이트맵은 이 과정을 보조하는 신호 역할을 한다.

**next-sitemap** 패키지는 Next.js 프로젝트에서 sitemap.xml과 robots.txt를 자동으로 생성해주는 도구다. 패키지 설치 후 `next-sitemap.config.js`에 사이트 URL, robots.txt 생성 여부, 사이트맵 분할 크기, 페이지 우선순위·변경 빈도, 크롤링 제외 경로(`exclude`) 등을 선언적으로 설정하면, 빌드 스크립트(`next-sitemap && next build`)에 연결해 빌드할 때마다 최신 사이트맵이 자동 생성된다. 정적으로 결정되지 않는 **동적 페이지**(상품 상세, 게시글 등)는 `getServerSideSitemap` API를 `getServerSideProps`에서 호출해 별도로 URL 목록을 구성해야 한다.

이 접근은 SEO를 매번 수작업으로 점검하는 대신, 프로젝트 구축 단계에서 체크리스트·가이드로 표준화하고 빌드 파이프라인에 자동화를 편입시키는 실무 패턴을 보여준다. 크롤링에서 제외해야 하는 페이지(비공개·관리자 페이지 등)를 `exclude` 설정에서 빠뜨리면 의도치 않게 노출될 수 있어 프로젝트마다 확인이 필요하다.

## 핵심 내용
- 사이트맵은 크롤링을 보장하지 않지만 대부분의 경우 크롤링 효율을 개선함
- **next-sitemap**: `next-sitemap.config.js` 설정 + 빌드 스크립트 연결로 sitemap.xml·robots.txt 자동 생성
- 주요 설정: `siteUrl`, `generateRobotsTxt`, `sitemapSize`, `changefreq`, `priority`, `exclude`
- 동적 페이지는 `getServerSideSitemap`으로 별도 처리 필요
- 사이트맵/robots 생성을 빌드 프로세스에 편입하면 누락 없이 일관되게 SEO 기본기를 지킬 수 있음

## 관련 개념
- [[코어 웹 바이탈과 SEO]] — 사이트맵이 크롤링 효율을 다룬다면, 코어 웹 바이탈은 크롤링 이후 페이지 품질(순위 신호)을 다룸
- [[Next.js 레이아웃과 템플릿]] — 같은 Next.js App Router 생태계의 다른 구조적 관심사
- [[증분 정적 재생성 (ISR)]] — 정적/동적 페이지 구분이 사이트맵 생성 전략에도 영향을 미침

## 출처
- [Next.js SEO 자동으로 적용하기](https://story.pxd.co.kr/1716) — 2023-08-24, Seulbi Lee
