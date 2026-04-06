# pxd 블로그 위키

## 프로젝트 개요
pxd story 블로그 1584개 글의 메타데이터 기반 정적 위키 사이트.
본문 없이 제목 + 원글 링크(`https://story.pxd.co.kr/{id}`)로만 참조.

## 기술 스택
- **Astro** (정적 빌드)
- **Cloudflare Pages** 배포
- **Node 22** 필수

## 데이터
- 소스 API: `https://story-api.pxd.systems/article-metas`
- 로컬 캐시: `raw/all_metas.json`
- 데이터 갱신: API 재호출 후 `raw/all_metas.json` 덮어쓰기 → `npm run build`

## 구조
- `src/lib/data.ts` — 메타데이터 로드, 집계 함수
- `src/layouts/Base.astro` — 공통 레이아웃 + 네비게이션
- `src/components/ArticleList.astro` — 글 목록 컴포넌트
- `src/pages/` — 페이지 (index, overview, categories, authors, tags, years)

## 빌드 & 배포
```bash
nvm use 22
npm run build        # dist/ 생성
npm run preview      # 로컬 확인
# Cloudflare Pages: git push → 자동 빌드
```

## 데이터 업데이트 절차
1. `python3 -c "import urllib.request,json; d=json.loads(urllib.request.urlopen('https://story-api.pxd.systems/article-metas').read()); open('raw/all_metas.json','w').write(json.dumps(d,ensure_ascii=False,indent=2))"`
2. `npm run build`
3. 커밋 & 푸시

## 규칙
- 태그 개별 페이지는 상위 30개만 생성
- 파일명 slug: 공백/특수문자 → `-` 치환 (`toSlug()` in data.ts)
- 날짜: Unix timestamp(ms) → `YYYY-MM-DD` 변환
- 라이트 모드, 주 색상 `#3b82f6`, 폰트 `KoddiUD OnGothic`
