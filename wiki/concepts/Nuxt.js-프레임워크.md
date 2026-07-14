---
type: concept
domain: "웹 개발"
name: "Nuxt.js 프레임워크"
sources: ["/1595", "/1623"]
updated: "2026-07-15"
---
# Nuxt.js 프레임워크

**Nuxt.js**는 **Vue.js**를 기반으로 **SSR(Server Side Rendering)** 웹 페이지를 구축할 수 있게 해주는 프레임워크다. CSR(Client Side Rendering)만으로는 검색엔진이 콘텐츠가 채워지지 않은 빈 HTML을 먼저 받게 되어 **SEO(검색엔진 최적화)**에 불리한데, Nuxt는 데이터까지 삽입된 완성된 HTML을 서버에서 렌더링해 내려주므로 이 문제를 해결한다. UX 관점에서도 SEO는 콘텐츠의 발견 가능성과 직결되는 요소이므로, SSR 도입은 기술적 선택이자 사용자 경험 개선 활동이라 할 수 있다.

Vue와 거의 동일한 컴포넌트 작성 구조를 유지하면서도, **파일 기반 자동 라우팅**과 **디렉터리 컨벤션**을 통해 반복적인 설정 작업을 줄여주는 것이 Nuxt의 핵심 강점이다. `pages` 디렉터리에 Vue 파일을 추가하기만 하면 `vue-router` 설정이 자동으로 생성되고, 모든 경로에 대한 코드 분할도 자동으로 처리된다. 페이지 간 이동은 일반 `a` 태그 대신 `NuxtLink` 컴포넌트를 사용하며, 폴더명에 언더스코어를 붙인 파일(`_id.vue`)로 슬러그 기반의 동적 라우터도 구성할 수 있다.

스타일링 측면에서는 **Sass(SCSS)** 연동에 별도 설정이 필요하다. `sass`, `sass-loader`를 설치한 뒤 `nuxt.config.js`의 css 섹션에 전역 스타일 파일을 지정하면 매 컴포넌트에서 import 없이 해당 스타일이 적용된다. 변수·믹스인처럼 스크립트가 아닌 값을 전역으로 공유하려면 `@nuxtjs/style-resources` 모듈을 `buildModules`에 추가하고 `styleResources` 옵션에 대상 scss 파일을 등록해야 한다.

디렉터리 구조는 역할별로 고정되어 있다. `pages`(뷰·라우트), `components`(컴포넌트), `assets`(스타일·이미지·폰트), `static`(정적 파일), `plugins`(앱 인스턴스화 전 실행할 플러그인)가 기본 구성이며, `store` 등은 필요에 따라 추가한다. `nuxt.config.js`는 모듈 추가와 기본 설정 재정의를 담당하는 중앙 설정 파일이다.

SSR 환경에서 데이터를 미리 채워 넣기 위해 Nuxt는 **asyncData**와 **fetch**라는 두 가지 데이터 페칭 훅을 제공한다. 순수 Vue.js에서는 라이프사이클이 동기적으로 진행되어 `mounted()` 훅 안에서 비동기 API를 호출하고 화면이 그려진 뒤 데이터를 채우는 방식이 일반적이지만, 이 경우 서버가 내려주는 초기 HTML에는 데이터가 비어 있어 SSR의 이점을 살리지 못한다. **asyncData**는 `created()` 훅 직전, 즉 컴포넌트 인스턴스화 이전에 실행되어 `this` 컨텍스트를 사용할 수 없고 페이지 컴포넌트에서만 쓸 수 있지만, 반환한 값이 곧바로 `data`에 병합되어 완성된 상태로 서버 렌더링된다. **fetch**는 `created()` 이후 실행되어 `this`와 Vuex `store`를 사용할 수 있고 페이지뿐 아니라 모든 컴포넌트에서 사용 가능하며, `$fetch()`로 라이프사이클 밖에서 수동 재호출하거나 `$fetchState.pending`/`$fetchState.error`로 로딩·에러 상태를 화면에 표시할 수 있어 asyncData보다 유연하다. `fetchOnServer`(SSR 중 fetch 실행 여부, 기본값 true), `fetchDelay`(최소 실행 시간, 기본값 200ms), `keep-alive` 디렉티브(fetch 결과 캐싱으로 재방문 시 API 재호출 방지) 같은 옵션으로 세부 동작을 조정한다.

## 핵심 내용
- **Nuxt.js**: Vue.js 기반 SSR 프레임워크, SEO 대응을 위해 CSR 대신 SSR이 필요한 경우 채택
- **CSR vs SSR**: CSR은 빈 HTML + 이후 데이터 요청, SSR은 데이터가 삽입된 완성 HTML을 서버에서 전달
- **파일 기반 라우팅**: `pages` 디렉터리 구조가 곧 라우트 → 라우터 재작성 불필요, 자동 코드 분할
- **NuxtLink**: 사이트 내부 이동 전용 컴포넌트, 외부 링크는 `a` 태그 사용
- **동적 라우터**: `_id.vue` 형태의 파일명으로 슬러그 기반 경로 구성
- **Sass 연동**: `sass-loader` 설치 + `nuxt.config.js` css 섹션 지정 → import 없이 전역 스타일 적용
- **@nuxtjs/style-resources**: scss 변수·믹스인을 모든 컴포넌트에 자동 주입하는 모듈
- 디렉터리 컨벤션: `pages`/`components`/`assets`/`static`/`plugins` + `nuxt.config.js`
- **asyncData**: `created()` 이전 실행, `this` 사용 불가, 페이지 컴포넌트 전용, 반환값이 곧바로 `data`에 병합
- **fetch**: `created()` 이후 실행, `this`·Vuex store 사용 가능, 모든 컴포넌트에서 사용 가능, `$fetch()` 수동 재호출과 `$fetchState`로 로딩·에러 표시
- fetch 옵션: `fetchOnServer`(SSR 중 실행 여부), `fetchDelay`(최소 실행시간), `keep-alive`(캐싱으로 재호출 방지)

## 관련 개념
- [[Vue3 마이그레이션]] — Nuxt의 기반이 되는 Vue 프레임워크의 버전 전환
- [[SCSS 모듈 시스템]] — Nuxt의 style-resources 설정과 맞닿은 scss 전역 관리 방식
- [[코어 웹 바이탈과 SEO]] — Nuxt 도입 동기인 SEO·성능 최적화의 측정 지표
- [[Next.js 레이아웃과 템플릿]] — 동일한 목적(SSR, 파일 기반 라우팅)을 가진 React 진영 프레임워크
- [[UX 엔지니어 직무와 XE 그룹]] — 이 글이 게재된 pxd XE Group의 프론트엔드 실무 범위

## 출처
- [Nuxt.js](https://story.pxd.co.kr/1595) — 2021-10-28, 알 수 없는 사용자
- [Nuxt Data fetching](https://story.pxd.co.kr/1623) — 2022-04-28, seonju.lee
