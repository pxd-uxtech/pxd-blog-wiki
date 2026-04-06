#!/bin/bash
# pxd 블로그 위키 자동 ingest (서브에이전트 병렬 처리)
# 사용: ./scripts/auto-ingest.sh [글 수, 기본 10]

set -e
cd "$(dirname "$0")/.."

N=${1:-10}
LOG_FILE="scripts/auto-ingest.log"

echo "$(date '+%Y-%m-%d %H:%M:%S') — ingest 시작 (${N}개)" >> "$LOG_FILE"

# ingest 대상 확인
PRIORITY=$(python3 scripts/ingest_priority.py "$N")
echo "$PRIORITY" >> "$LOG_FILE"

# 대상이 없으면 종료
if echo "$PRIORITY" | grep -q "=== Ingest 대상 상위 0개"; then
  echo "$(date '+%Y-%m-%d %H:%M:%S') — ingest 대상 없음, 종료" >> "$LOG_FILE"
  exit 0
fi

# API URL 추출
API_URL=$(echo "$PRIORITY" | grep "story-api.pxd.systems" | head -1)

# URL 파라미터에서 개별 URL 추출 (예: /958,/1615,/567 → 배열)
URL_PARAM=$(echo "$API_URL" | sed 's|.*urls=||' | sed 's|&.*||')
HALF=$((N / 2))

# 앞쪽 절반, 뒤쪽 절반으로 분리
URLS_A=$(echo "$URL_PARAM" | tr ',' '\n' | head -$HALF | tr '\n' ',' | sed 's/,$//')
URLS_B=$(echo "$URL_PARAM" | tr ',' '\n' | tail -n +$((HALF + 1)) | tr '\n' ',' | sed 's/,$//')

API_A="https://story-api.pxd.systems/article-metas?urls=${URLS_A}&body=1"
API_B="https://story-api.pxd.systems/article-metas?urls=${URLS_B}&body=1"

DATE_STR=$(date +%Y-%m-%d)
COMMIT_MSG="ingest: auto-ingest $(date +%Y-%m-%d-%H%M)"

# claude -p로 ingest 실행 (서브에이전트 병렬)
claude -p --model sonnet "
pxd 블로그 위키 ingest를 수행해. 먼저 WIKI_SCHEMA.md를 읽어 규칙을 확인해.

Agent 도구를 사용해서 2개의 서브에이전트를 **동시에** 실행해:

**에이전트 1** (subagent_type: implementer, model: sonnet):
- 이 API URL로 본문 fetch: ${API_A}
- 각 글을 읽고 wiki/concepts/에 개념 페이지 생성 또는 기존 페이지에 병합
- WIKI_SCHEMA.md의 형식을 정확히 따를 것
- 원문 복사 금지, 핵심을 종합 요약
- 관련 개념은 [[위키링크]]로 연결
- 출처에 원글 링크 포함

**에이전트 2** (subagent_type: implementer, model: sonnet):
- 이 API URL로 본문 fetch: ${API_B}
- 동일한 규칙으로 개념 페이지 생성/병합

두 에이전트가 완료되면 반드시 다음을 직접 수행해 (서브에이전트에 위임하지 말 것):
1. wiki/index.md에 새로 생성된 개념을 모두 추가 (가나다순 정렬)
2. wiki/log.md 맨 위(# 제목 바로 아래)에 추가: ## [${DATE_STR}] ingest | 처리한 글 제목들
3. Bash 도구로 실행: git add wiki/ && git commit -m '${COMMIT_MSG}' && git push

git commit과 push는 절대 생략하지 마. 이것이 이 작업의 최종 단계야.
" 2>> "$LOG_FILE"

echo "$(date '+%Y-%m-%d %H:%M:%S') — ingest 완료" >> "$LOG_FILE"
