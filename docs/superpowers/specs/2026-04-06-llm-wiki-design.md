# pxd 블로그 LLM Wiki 설계

## 목적

1. **온보딩** — 신입/외부인이 pxd 블로그의 핵심 지식을 빠르게 파악
2. **LLM 지식 인덱스** — LLM에게 컨텍스트로 넘겨 블로그 관련 질문에 답할 수 있는 구조화된 지식 저장소

## 핵심 원칙

- Karpathy LLM Wiki 패턴 적용: Raw → Wiki → Schema 3계층
- 위키 구조는 사전 정의하지 않음. LLM이 본문을 읽으면서 자연스럽게 형성
- 개념 페이지만 생성 (개별 글 요약 없음)
- 본문은 위키에 복사하지 않음. 종합 요약 + 원글 링크

## 3계층 구조

### Raw (원본)
- `raw/all_metas.json` — 전체 1,584개 글 메타데이터
- `raw/cluster_data.json` — 주제별 계층 클러스터링 + 조회수 (ingest 우선순위용)
- 본문은 저장하지 않음. 필요시 API `body=1`로 동적 fetch

### Wiki (LLM 생성물)
- `wiki/concepts/{개념명}.md` — 개념 페이지 (LLM이 생성·유지)
- `wiki/index.md` — 개념 페이지 목차 + 한 줄 요약
- `wiki/log.md` — ingest 이력 (append-only)

### Schema
- `WIKI_SCHEMA.md` — 위키 구조 규칙, 페이지 형식, ingest 절차
- `CLAUDE.md` — 프로젝트 관리 지침 (기존)

## 개념 페이지 형식

```markdown
---
type: concept
name: "{개념명}"
sources: ["/1234", "/1235"]
updated: "2026-04-06"
---
# {개념명}

{LLM이 여러 글을 종합하여 작성한 요약. 2~5단락.}

## 핵심 내용
- ...

## 관련 개념
- [[관련개념1]] — 한 줄 설명
- [[관련개념2]] — 한 줄 설명

## 출처
- [글 제목](https://story.pxd.co.kr/{id}) — YYYY-MM-DD, 저자
```

## Ingest 워크플로우

### 우선순위
- `raw/cluster_data.json`의 `size`(조회수) 기준 상위 글부터
- 한 세션에 5~10개 글 처리

### 절차
1. 대상 글 선택 (조회수 상위, 아직 ingest 안 된 것)
2. API `https://story-api.pxd.systems/article-metas?urls=/1234,/1235&body=1`로 본문 fetch
3. LLM이 본문을 읽고 판단:
   - 기존 개념 페이지에 병합할 것인지
   - 새 개념 페이지를 생성할 것인지
4. 개념 페이지 생성 또는 업데이트
5. `wiki/index.md`에 새 항목 추가 또는 기존 항목 업데이트
6. `wiki/log.md`에 기록: `## [YYYY-MM-DD] ingest | {처리한 글 제목들}`
7. 관련 개념 페이지의 `[[크로스레퍼런스]]` 업데이트

### Ingest 시 LLM 지침 (WIKI_SCHEMA.md에 포함)
- 원문을 그대로 복사하지 말 것. 핵심을 추출하여 종합 요약
- 여러 글이 같은 주제를 다루면 하나의 개념 페이지에 통합
- 개념 페이지 이름은 한글, 구체적으로 (예: "디자인 시스템" O, "디자인" X)
- 관련 개념은 `[[위키링크]]` 형식으로 연결
- 출처 섹션에 반드시 원글 링크 포함

## 정적 사이트 통합

기존 Astro 정적 사이트(카테고리/저자/태그/연도별 뷰)는 그대로 유지.
`wiki/concepts/` 마크다운을 Astro에서 렌더링하는 페이지 추가:

- `/concepts/` — 개념 페이지 목록
- `/concepts/{slug}` — 개별 개념 페이지

## 데이터 API

| 용도 | URL |
|---|---|
| 전체 메타데이터 | `https://story-api.pxd.systems/article-metas` |
| 본문 포함 | `?urls=/1234,/1235&body=1` |

## 파일 구조 (최종)

```
pxd블로그wiki/
├── CLAUDE.md
├── WIKI_SCHEMA.md
├── PLAN.md
├── raw/
│   ├── all_metas.json
│   └── cluster_data.json
├── wiki/
│   ├── index.md
│   ├── log.md
│   └── concepts/
│       ├── 디자인-시스템.md
│       ├── 피츠의-법칙.md
│       └── ...
├── src/
│   ├── pages/
│   │   ├── index.astro
│   │   ├── overview.astro
│   │   ├── categories/...
│   │   ├── authors/...
│   │   ├── tags/...
│   │   ├── years/...
│   │   └── concepts/       ← 추가
│   │       ├── index.astro
│   │       └── [...slug].astro
│   ├── layouts/
│   ├── components/
│   └── lib/
│       └── data.ts
├── astro.config.mjs
├── package.json
└── docs/superpowers/specs/
    └── 2026-04-06-llm-wiki-design.md
```
