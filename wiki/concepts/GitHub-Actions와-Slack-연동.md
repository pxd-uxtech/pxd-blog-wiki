---
type: concept
name: "GitHub Actions와 Slack 연동"
sources: ["/1769"]
updated: "2026-04-06"
---
# GitHub Actions와 Slack 연동

GitHub Actions는 GitHub에서 제공하는 CI/CD 서비스로, YAML 파일로 정의된 워크플로우를 통해 코드 이벤트(이슈 생성, PR 생성 등)에 반응하는 자동화 작업을 실행할 수 있다. Slack의 Incoming Webhook을 결합하면 특정 이벤트 발생 시 지정된 Slack 채널에 맞춤형 알림을 보내는 봇을 만들 수 있다.

구현 절차는 크게 Slack 앱 설정과 GitHub Actions 워크플로우 작성으로 나뉜다. Slack에서는 api.slack.com에서 앱을 새로 만들고 Incoming Webhooks를 활성화한 후 원하는 채널에 Webhook URL을 생성한다. 멘션(@리뷰어) 기능이 필요하다면 chat:write, chat:write.customize 권한을 추가하고 앱을 해당 채널에 통합해야 한다. GitHub 쪽에서는 레포지토리의 .github/workflows/ 경로에 YAML 파일을 생성하고, slackapi/slack-github-action 라이브러리를 활용해 PR 리뷰어 지정 이벤트 발생 시 Webhook으로 메시지를 전송하는 로직을 작성한다.

이 방식의 장점은 기존 GitHub 워크플로우를 거의 건드리지 않고 필요한 정보만 선택적으로 알림으로 보낼 수 있다는 점이다. URI Scheme 딥링크처럼 외부 서비스와 연결하는 단순하고 실용적인 자동화 패턴으로, 팀 협업의 정보 과부하를 줄이는 데 효과적이다.

## 핵심 내용
- Incoming Webhook: 외부 앱에서 Slack 채널로 메시지를 보내는 표준 연동 방식
- GitHub Actions 워크플로우: .github/workflows/*.yml 파일로 이벤트 트리거·메시지 형식 정의
- 멘션 알림을 위해 chat:write, chat:write.customize 권한 및 채널 앱 통합 필요
- slackapi/slack-github-action 라이브러리로 구현을 간소화할 수 있음
- 기존 GitHub 봇 대비 불필요한 알림 없이 핵심 정보(PR 제목·리뷰어·링크)만 전달 가능

## 관련 개념
- [[웹 아키텍처]] — CI/CD 파이프라인과 자동화 인프라 맥락
- [[AI 코딩 도구 활용]] — 자동화 스크립트 작성에 AI 코딩 도구를 활용하는 사례

## 출처
- [Github Actions를 이용한 Slack App(Bot) 만들기](https://story.pxd.co.kr/1769) — 2024-05-16, hyejun.lee
