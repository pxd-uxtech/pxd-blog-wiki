#!/bin/bash
# pxd 블로그 위키 자동 ingest 스케줄러 설정
# 사용: ./scripts/setup-cron.sh [install|uninstall|status]

set -e

PROJECT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
PLIST_NAME="com.pxd.blog-wiki-ingest"
PLIST_PATH="$HOME/Library/LaunchAgents/${PLIST_NAME}.plist"

# 필수 도구 확인
check_deps() {
  local missing=()
  command -v claude >/dev/null || missing+=("claude (Claude Code CLI)")
  command -v python3 >/dev/null || missing+=("python3")
  command -v node >/dev/null || missing+=("node")
  command -v git >/dev/null || missing+=("git")

  if [ ${#missing[@]} -gt 0 ]; then
    echo "❌ 누락된 도구:"
    for m in "${missing[@]}"; do echo "   - $m"; done
    exit 1
  fi

  # Node 22 확인
  NODE_MAJOR=$(node -v | cut -d. -f1 | tr -d 'v')
  if [ "$NODE_MAJOR" -lt 22 ]; then
    echo "❌ Node 22 이상 필요 (현재: $(node -v))"
    echo "   nvm install 22 && nvm use 22"
    exit 1
  fi

  echo "✅ 필수 도구 확인 완료"
  echo "   claude: $(which claude)"
  echo "   node:   $(node -v)"
  echo "   python: $(python3 --version)"
}

install() {
  check_deps

  # npm install
  echo "📦 npm install..."
  cd "$PROJECT_DIR" && npm ci --silent

  # PATH 구성 (현재 환경 기반)
  CLAUDE_DIR=$(dirname "$(which claude)")
  NODE_DIR=$(dirname "$(which node)")
  PYTHON_DIR=$(dirname "$(which python3)")
  BREW_DIR=$(dirname "$(which git)")
  FULL_PATH="${CLAUDE_DIR}:${NODE_DIR}:${PYTHON_DIR}:${BREW_DIR}:/usr/local/bin:/usr/bin:/bin"

  # plist 생성
  cat > "$PLIST_PATH" <<EOF
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>Label</key>
    <string>${PLIST_NAME}</string>
    <key>ProgramArguments</key>
    <array>
        <string>${PROJECT_DIR}/scripts/auto-ingest.sh</string>
        <string>5</string>
    </array>
    <key>StartCalendarInterval</key>
    <array>
        <dict><key>Hour</key><integer>1</integer><key>Minute</key><integer>0</integer></dict>
        <dict><key>Hour</key><integer>1</integer><key>Minute</key><integer>30</integer></dict>
        <dict><key>Hour</key><integer>2</integer><key>Minute</key><integer>0</integer></dict>
        <dict><key>Hour</key><integer>2</integer><key>Minute</key><integer>30</integer></dict>
        <dict><key>Hour</key><integer>3</integer><key>Minute</key><integer>0</integer></dict>
        <dict><key>Hour</key><integer>3</integer><key>Minute</key><integer>30</integer></dict>
        <dict><key>Hour</key><integer>4</integer><key>Minute</key><integer>0</integer></dict>
        <dict><key>Hour</key><integer>4</integer><key>Minute</key><integer>30</integer></dict>
        <dict><key>Hour</key><integer>5</integer><key>Minute</key><integer>0</integer></dict>
        <dict><key>Hour</key><integer>5</integer><key>Minute</key><integer>30</integer></dict>
    </array>
    <key>WorkingDirectory</key>
    <string>${PROJECT_DIR}</string>
    <key>EnvironmentVariables</key>
    <dict>
        <key>PATH</key>
        <string>${FULL_PATH}</string>
        <key>HOME</key>
        <string>${HOME}</string>
    </dict>
    <key>StandardOutPath</key>
    <string>${PROJECT_DIR}/scripts/auto-ingest-stdout.log</string>
    <key>StandardErrorPath</key>
    <string>${PROJECT_DIR}/scripts/auto-ingest-stderr.log</string>
</dict>
</plist>
EOF

  launchctl load "$PLIST_PATH"
  echo ""
  echo "✅ 설치 완료"
  echo "   스케줄: 매일 새벽 1:00~5:30, 30분 간격"
  echo "   로그:   ${PROJECT_DIR}/scripts/auto-ingest.log"
  echo ""
  echo "   수동 실행: ./scripts/auto-ingest.sh 5"
  echo "   제거:      ./scripts/setup-cron.sh uninstall"
}

uninstall() {
  if [ -f "$PLIST_PATH" ]; then
    launchctl unload "$PLIST_PATH" 2>/dev/null || true
    rm "$PLIST_PATH"
    echo "✅ 제거 완료"
  else
    echo "설치된 스케줄러가 없습니다."
  fi
}

status() {
  if launchctl list | grep -q "$PLIST_NAME"; then
    echo "✅ 실행 중"
    launchctl list | grep "$PLIST_NAME"
  else
    echo "⏹ 미설치 또는 중지됨"
  fi

  if [ -f "${PROJECT_DIR}/scripts/auto-ingest.log" ]; then
    echo ""
    echo "최근 로그:"
    tail -5 "${PROJECT_DIR}/scripts/auto-ingest.log"
  fi
}

case "${1:-install}" in
  install)   install ;;
  uninstall) uninstall ;;
  status)    status ;;
  *)         echo "사용: $0 [install|uninstall|status]" ;;
esac
