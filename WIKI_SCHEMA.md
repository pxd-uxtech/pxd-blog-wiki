# pxd 블로그 위키 스키마

## 3계층 구조

### Raw (원본)
- `raw/all_metas.json` — 전체 메타데이터
- `raw/cluster_data.json` — 주제별 클러스터링 + 조회수
- 본문: API `?urls=/1234&body=1`로 동적 fetch. 저장하지 않음.

### Wiki (LLM 생성물)
- `wiki/concepts/{개념명}.md` — 개념 페이지
- `wiki/index.md` — 목차
- `wiki/log.md` — 이력

### Schema
- `WIKI_SCHEMA.md` — 이 파일
- `CLAUDE.md` — 프로젝트 지침

## 개념 페이지 형식

파일명: 한글, 공백은 `-`로 치환. 예: `디자인-시스템.md`

```markdown
---
type: concept
name: "{개념명}"
sources: ["/1234", "/1235"]
updated: "YYYY-MM-DD"
---
# {개념명}

{여러 글을 종합한 요약. 2~5단락. 원문 복사 금지.}

## 핵심 내용
- 핵심 포인트 1
- 핵심 포인트 2

## 관련 개념
- [[관련개념1]] — 한 줄 설명
- [[관련개념2]] — 한 줄 설명

## 출처
- [글 제목](https://story.pxd.co.kr/{id}) — YYYY-MM-DD, 저자
```

## Ingest 절차

1. `python3 scripts/ingest_priority.py N`으로 대상 글 선택 (조회수 상위, 미처리)
2. API로 본문 fetch: `https://story-api.pxd.systems/article-metas?urls=/1234,/1235&body=1`
3. 본문을 읽고 판단:
   - 기존 개념 페이지에 병합 → 해당 페이지 수정, sources에 추가
   - 새 개념 필요 → 새 파일 생성
4. `wiki/index.md` 업데이트 (항목 추가/수정)
5. `wiki/log.md`에 기록
6. 관련 개념의 `[[크로스레퍼런스]]` 업데이트

## Ingest 규칙

- 원문을 그대로 복사하지 말 것. 핵심을 추출하여 종합 요약
- 여러 글이 같은 주제 → 하나의 개념 페이지에 통합
- 개념명은 한글, 구체적으로 (예: "디자인 시스템" O, "디자인" X)
- 관련 개념은 `[[위키링크]]` 형식
- 출처 섹션에 반드시 원글 링크 포함
- sources 배열에서 이미 처리된 URL은 중복 추가하지 않을 것

## 로그 형식 (wiki/log.md)

```markdown
## [YYYY-MM-DD] ingest | 글제목1, 글제목2, ...
- 생성: 개념페이지1, 개념페이지2
- 업데이트: 기존개��페이지1
```
