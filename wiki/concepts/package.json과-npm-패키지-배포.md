---
type: concept
domain: "웹 개발"
name: "package.json과 npm 패키지 배포"
sources: ["/1906"]
updated: "2026-09-07"
---
# package.json과 npm 패키지 배포

`package.json`은 단일 프로젝트 안에서는 흔히 "의존성 목록과 실행 스크립트를 관리하는 파일" 정도로 다뤄지지만, 여러 서비스가 설치해 쓰는 **공통 컴포넌트 패키지**를 만들어 배포하는 순간부터는 훨씬 더 많은 역할을 한다. 핵심은 **peerDependencies**다. `dependencies`(런타임에 실제로 필요한 라이브러리)와 `devDependencies`(개발·빌드·테스트에만 필요한 도구)는 익숙한 개념이지만, `npm init` 시 기본 생성되지 않는 `peerDependencies`는 **"이 패키지를 사용하는 쪽에서 직접 설치해야 하는 의존성"**을 뜻한다. 공통 컴포넌트가 `react`·`react-dom`·`styled-components` 같은 라이브러리를 자체 `dependencies`로 포함해버리면, 이를 사용하는 서비스의 React와 중복 설치되어 Hooks 오류나 Context 분리 문제가 발생할 수 있다 — 그래서 이런 라이브러리는 peerDependencies로 선언해 **버전 호환성을 사용하는 쪽에 위임**하는 것이 안정적이다.

실무에서는 `devDependencies`와 `peerDependencies`에 같은 라이브러리를 **동시에 선언**하는 방식이 권장된다. `dependencies`에 넣었다가 배포 시점에 제외하는 방식도 가능하지만 "나중에 빼는 걸 잊는" 실수가 발생하기 쉽기 때문에, 개발 단계에는 devDependencies로 필요한 버전을 설치해 두고 실제 배포되는 패키지에는 peerDependencies만 명시하는 편이 더 안전하다. 이때 빌드 도구의 `external` 설정(예: Vite/Rollup의 `build.rollupOptions.external`)을 함께 지정하지 않으면, peerDependencies로 선언한 라이브러리라도 번들 결과물에 그대로 포함될 수 있으므로 반드시 설정해야 한다.

배포 범위를 통제하는 **files** 필드도 중요하다. 이 필드를 지정하지 않으면 프로젝트의 불필요한 파일까지 패키지에 포함될 수 있으므로, 실제로는 `dist`(번들 결과물)와 `README.md` 정도만 명시하는 것이 좋다. **engines**·**packageManager** 필드는 협업 환경의 버전 불일치 문제를 예방한다 — Node.js 버전이 12~20까지 혼재하고 npm·yarn·pnpm이 혼용되는 프로젝트에서는 `engines.node`로 최소 Node 버전을 강제하고 `packageManager`로 특정 패키지 매니저(예: `pnpm@9.0.0`)를 명시하는 것이 lockfile 충돌 같은 빌드 오류를 줄이는 데 도움이 된다. 마지막으로 **version**은 단일 프로젝트에서는 크게 신경 쓰지 않아도 되지만, 여러 서비스가 각자 다른 시점에 설치해 쓰는 공통 패키지 구조에서는 **Semantic Versioning**(major.minor.patch — 하위 호환이 깨지는 변경/하위 호환 기능 추가/버그 수정) 규칙을 따르는 버전 관리와 배포 전 검증이 협업·배포 안정성의 핵심 기준이 된다.

## 핵심 내용
- **peerDependencies**: 사용하는 쪽에서 직접 설치해야 하는 의존성 — React 등 중복 설치 시 문제가 되는 라이브러리에 필수
- 공통 컴포넌트 설계 시 **devDependencies + peerDependencies 동시 선언** 권장(배포 시점에 dependencies를 빼먹는 실수 방지)
- peerDependencies로 선언해도 빌드 도구의 `external` 설정이 없으면 번들에 포함될 수 있음
- **files**: 배포에 포함할 파일을 명시적으로 제한(`dist`, `README.md` 등) — 불필요한 파일 배포 방지
- **engines**·**packageManager**: Node 버전·패키지 매니저를 강제해 협업 환경의 lockfile 충돌·빌드 오류 예방
- **version**: 공통 패키지 배포 구조에서는 Semantic Versioning(major/minor/patch) 준수와 배포 전 검증이 필수

## 관련 개념
- [[Vite와 React 빌드 환경]] — peerDependencies·external 설정이 실제로 적용되는 빌드 도구 설정
- [[React 컴포넌트 패턴]] — package.json이 관리하는 React 프로젝트의 기본 구조
- [[디자인 시스템]] — 공통 컴포넌트를 패키지로 배포하는 구조는 디자인 시스템 운영의 기술적 기반

## 출처
- [package.json 어디까지 알고 계신가요? (peerDependencies, files, engines, version)](https://story.pxd.co.kr/1906) — 2026-07-09, seonju.lee
