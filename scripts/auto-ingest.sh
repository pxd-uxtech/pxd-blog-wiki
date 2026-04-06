#!/bin/bash
# pxd 블로그 위키 자동 ingest
# 사용: ./scripts/auto-ingest.sh [글 수, 기본 5]

set -e
cd "$(dirname "$0")/.."

N=${1:-5}
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

# claude -p로 ingest 실행
claude -p --model haiku "
다음 지시를 정확히 따라 pxd 블로그 위키 ingest를 수행해.

1. WIKI_SCHEMA.md를 읽어 위키 규칙을 확인해.
2. 아래 API URL로 본문을 fetch해:
   ${API_URL}
3. 각 글의 본문을 읽고, wiki/concepts/에 개념 페이지를 생성하거나 기존 페이지에 병합해.
   - WIKI_SCHEMA.md의 개념 페이지 형식을 정확히 따를 것
   - 원문 복사 금지, 핵심을 종합 요약
   - 관련 개념은 [[위키링크]]로 연결
4. wiki/index.md에 새 개념을 추가해.
5. wiki/log.md에 오늘 날짜로 ingest 기록을 추가해.
6. git add wiki/ && git commit -m 'ingest: auto-ingest $(date +%Y-%m-%d-%H%M)'
7. git push
" 2>> "$LOG_FILE"

echo "$(date '+%Y-%m-%d %H:%M:%S') — ingest 완료" >> "$LOG_FILE"
