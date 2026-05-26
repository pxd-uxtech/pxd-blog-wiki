---
type: concept
domain: "웹 개발"
name: "Vite와 React 빌드 환경"
sources: ["/1860"]
updated: "2026-05-27"
---
# Vite와 React 빌드 환경

2025년 2월 React 팀이 **Create React App(CRA)**의 공식 deprecated를 선언했다. CRA는 오랫동안 React 프로젝트의 표준 시작점 역할을 했지만, 불필요한 패키지 포함으로 인한 초기화 속도 저하, Webpack 4 기반의 낡은 의존성, eject 없이는 불가능한 커스터마이징, React 19 이후 호환 오류 등 복합적인 문제가 누적되었다. 이에 따라 **Next.js·Remix** 같은 프레임워크 선택 또는 **Vite·Parcel** 같은 빌드 도구 직접 사용이 대안으로 부상했으며, 그 중 Vite가 CRA의 가장 자연스러운 대체재로 자리 잡고 있다.

**Vite**의 핵심 장점은 **ES Module(ESM)** 기반 개발 서버에 있다. 기존 번들러 방식처럼 전체 소스를 번들링한 뒤 서버를 시작하지 않고, 브라우저가 직접 모듈을 필요할 때 로드하도록 하기 때문에 개발 서버 시작이 훨씬 빠르다. **HMR(Hot Module Replacement)**도 변경된 모듈만 교체하고 나머지는 캐시를 활용하여 반영 속도를 극대화한다. 프로덕션 빌드는 **Rollup** 기반으로, 트리 쉐이킹(사용하지 않는 코드 자동 제거)과 동적 import를 통한 코드 분할로 초기 로딩 성능을 높인다.

Vite로 React + TypeScript 환경을 설정하는 명령어는 `npm create vite@latest my-react-app -- --template react-ts`이며, Node.js 20.19+ 이상이 요구된다. CRA와 달리 복잡한 설정 선택 없이 단일 명령으로 빠르게 시작할 수 있고, 설정 파일은 `vite.config.ts`로 관리된다. 기본 포트는 5173이며, `npm run build` 실행 시 `/dist` 폴더에 빌드 결과물이 생성된다. Sass·Less·Stylus 등 CSS 전처리기와 CSS 모듈, PostCSS를 별도 설정 없이 바로 사용할 수 있다. **Storybook** 연동 시에는 `npm create storybook@latest` 명령으로 `@storybook/react-vite`가 자동 설치되어 Vite 환경을 지원한다.

## 핵심 내용
- 2025년 2월 React 팀의 CRA deprecated 선언 — 더 이상 공식 지원 없음
- **CRA의 한계**: 무거운 패키지 구성, 오래된 Webpack 4 기반, eject 없이는 커스터마이징 불가
- **Vite의 핵심**: ESM 기반 개발 서버 → 번들링 생략으로 빠른 시작, HMR에서 변경된 모듈만 교체
- 프로덕션 빌드는 Rollup 기반 트리 쉐이킹 + 코드 분할
- 플러그인 시스템으로 eject 없이 확장 가능
- Node.js 20.19+ 필수, 기본 개발 포트 5173

## 관련 개념
- [[React 컴포넌트 패턴]] — Container/Presentational·Compound·HOC 등 React 컴포넌트 설계 패턴
- [[스토리북 컴포넌트 개발]] — Vite와 연동되는 컴포넌트 독립 개발·문서화 도구
- [[React TypeScript 패턴]] — Vite + react-ts 템플릿에서 활용하는 TypeScript 패턴
- [[브라우저 렌더링 파이프라인]] — ESM 기반 Vite 개발 서버와 관련된 브라우저 모듈 로딩 원리
- [[Next.js 레이아웃과 템플릿]] — Vite 대신 프레임워크 방향을 선택할 경우의 대안

## 출처
- [Create React App(CRA) 대안 Vite](https://story.pxd.co.kr/1860) — 2025-10-23, hyejun.lee
