---
type: concept
domain: "웹 개발"
name: "PWA 프로그레시브 웹 앱"
sources: ["/1810", "/1839"]
updated: "2026-04-07"
---
# PWA 프로그레시브 웹 앱

**PWA(Progressive Web App)**는 웹 기술로 구현하면서도 네이티브 앱과 유사한 경험을 제공하는 방식이다. 사용자는 앱 스토어를 거치지 않고 브라우저에서 홈 화면에 바로 추가할 수 있으며, **Service Worker**를 통한 오프라인 기능과 푸시 알림을 지원한다.

PWA 구현의 핵심은 **manifest.json** 파일이다. 앱 이름, 아이콘, 시작 URL, 디스플레이 모드(standalone으로 설정하면 브라우저 UI가 숨겨져 앱처럼 보임), 테마 색상 등을 정의한다. **PWABuilder.com** 같은 도구로 manifest 파일 유효성 검사와 생성을 도울 수 있다.

iOS에서는 표준 manifest 외에 추가 메타 태그가 필요하다. `apple-mobile-web-app-capable`, `apple-mobile-web-app-status-bar-style` 설정과 함께, iOS는 manifest의 아이콘을 무시하므로 `apple-touch-icon` 태그를 별도로 지정해야 한다. 스플래시 스크린은 디바이스별 정확한 해상도가 필요해 전용 생성 도구 활용이 권장된다.

**cheerio**와 같은 웹 크롤링 라이브러리를 함께 사용할 경우 CORS 문제가 발생할 수 있다. Vite 개발 환경에서는 `vite.config.ts`의 서버 프록시 설정으로, 배포 환경(Netlify 등)에서는 `netlify.toml`의 리다이렉트 규칙으로 각각 해결한다.

**웹 푸시 알림 구현**(Next.js 14 App Router + FCM 사례). 웹 푸시는 PWA의 가장 강력한 기능 중 하나로, 앱 설치 없이도 사용자와의 접점을 유지해 **유지보수 비용을 줄이고 리텐션을 높인다**. 구현은 4단계로 이루어진다. ① **Firebase 프로젝트 설정**: Firebase 콘솔에서 웹 앱 등록 후 설정값을 `.env`로 분리해 보안 강화. ② **Service Worker 작성**(`public/firebase-messaging-sw.js`): `install`에서 `skipWaiting()`으로 즉시 활성화, `push` 이벤트에서 `showNotification`으로 알림 표시, `notificationclick` 이벤트에서 `clients.openWindow(linkUrl)`로 이동 처리. Next.js에서 환경변수 노출을 막기 위해 messaging-sw는 별도 파일로 구성하는 것이 안전하다. ③ **알림 권한·로컬 스토리지 관리**: FCM 토큰과 권한 상태(`granted`/`denied`/`default`)를 로컬 스토리지에 저장해 매번 권한 요청을 반복하지 않는다. ④ **토큰 발급·서버 연동**: `Notification.requestPermission()` 후 `getToken({ vapidKey })`로 발급, 발급된 토큰을 서버에 POST. **Safari 주의사항**: Safari는 사용자 액션(버튼 클릭) 없이는 알림 권한 요청이 불가능하므로 **알림 허용 유도 UI**를 반드시 배치해야 한다.

## 핵심 내용
- PWA의 세 가지 핵심 기능: 홈 화면 추가, Service Worker 기반 오프라인 지원, 푸시 알림
- `manifest.json`의 `display: standalone`으로 네이티브 앱 외관 구현
- iOS는 manifest 아이콘을 인식하지 않아 `apple-touch-icon` 메타 태그 필수
- CORS 문제는 개발·배포 환경에 맞는 프록시 설정으로 해결
- 앱 스토어 배포 없이 URL 방문만으로 설치 유도 가능

## 관련 개념
- [[웹 아키텍처]] — Service Worker는 브라우저 캐싱과 네트워크 계층에 위치
- [[딥링크]] — PWA 홈 화면 추가와 딥링크는 모바일 접근성을 보완하는 두 전략
- [[웹 접근성과 WAI-ARIA]] — 네이티브 앱과 동등한 접근성을 PWA에서도 보장해야 함

## 출처
- [네이티브 앱과 같은 사용자 경험 - PWA (feat. 웹 크롤링 cheerio)](https://story.pxd.co.kr/1810) — 2024-11-11, Seulbi Lee
- [PWA 꽃 웹 푸시 기능 구현하기](https://story.pxd.co.kr/1839) — Seulbi Lee, UX Engineer 이야기
