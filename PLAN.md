# pxd 블로그 위키 구축 계획

> **목표**: pxd 블로그 1584개 글의 메타데이터를 기반으로 카테고리·태그·저자·연도별로 구조화된 정적 위키 사이트를 구축하고 Cloudflare Pages로 배포한다.
>
> **핵심 규칙**: 본문은 위키에 포함하지 않는다. 각 글은 `제목 + 원글 링크(https://story.pxd.co.kr/{id})`로만 참조한다.
>
> **공개 사이트**: 블로그 자체가 공개이므로 인증 불필요.

---

## API 정보

| 용도 | URL |
|---|---|
| 전체 메타데이터 | `https://story-api.pxd.systems/article-metas` |
| URL로 조회 | `?urls=/200,/1527` |
| 태그로 조회 | `?tags=UI,UX` |
| 카테고리로 조회 | `?categories=리뷰` |
| 저자로 조회 | `?authors=인턴뱁새` |
| 본문 포함 | `?urls=/200&body=1` |

### 메타데이터 응답 구조

```json
{
  "url": "/1891",
  "tags": ["AIEO", "SEO"],
  "date": 1775116200000,
  "author": "GEONIQ",
  "category": "pxd AI툴 이야기",
  "thumbnail": "https://img1.daumcdn.net/...",
  "title": "GEONIQ Integrated Insight Report"
}
```

- `date`: Unix timestamp (밀리초). `date / 1000`으로 변환.
- `url`: `/1891` → 원글: `https://story.pxd.co.kr/1891`

---

## 데이터 현황

- **총 글 수**: 1,584개
- **카테고리**: 16개
- **저자**: 65명
- **태그(고유)**: 2,629개
- **연도 범위**: 2009~2026

---

## 기술 스택

- **정적 사이트 빌더**: Astro
- **배포**: Cloudflare Pages
- **데이터 소스**: `raw/all_metas.json` (API에서 1회 fetch)

---

## 디렉토리 구조

```
pxd블로그wiki/
├── PLAN.md
├── CLAUDE.md                  # 프로젝트 관리 지침
├── raw/
│   └── all_metas.json         # 전체 메타데이터
├── src/
│   ├── pages/
│   │   ├── index.astro
│   │   ├── overview.astro
│   │   ├── categories/
│   │   │   ├── index.astro
│   │   │   └── [slug].astro
│   │   ├── authors/
│   │   │   ├── index.astro
│   │   │   └── [slug].astro
│   │   ├── tags/
│   │   │   ├── index.astro
│   │   │   └── [slug].astro
│   │   └── years/
│   │       ├── index.astro
│   │       └── [year].astro
│   ├── layouts/
│   │   └── Base.astro
│   ├── components/
│   │   └── ArticleList.astro
│   └── lib/
│       └── data.ts            # 메타데이터 로드 및 유틸
├── astro.config.mjs
├── package.json
└── tsconfig.json
```

---

## Phase 1: Astro 프로젝트 셋업

- [ ] Astro 프로젝트 초기화 + Cloudflare Pages 어댑터
- [ ] `src/lib/data.ts` — 메타데이터 로드/파싱 유틸
- [ ] `src/layouts/Base.astro` — 기본 레이아웃
- [ ] `src/components/ArticleList.astro` — 글 목록 컴포넌트

## Phase 2: 페이지 생성

- [ ] `index.astro` — 메인 인덱스
- [ ] `overview.astro` — 통계 요약
- [ ] 카테고리 페이지 (목록 + 개별 16개)
- [ ] 저자 페이지 (목록 + 개별 65개)
- [ ] 태그 페이지 (목록 + 상위 30개 개별)
- [ ] 연도별 페이지 (목록 + 2009~2026)

## Phase 3: 마무리 및 배포

- [ ] 크로스레퍼런스 (관련 태그, 관련 카테고리)
- [ ] CLAUDE.md 작성
- [ ] Cloudflare Pages 배포
