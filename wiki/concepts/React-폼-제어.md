---
type: concept
domain: "웹 개발"
name: "React 폼 제어"
sources: ["/1732"]
updated: "2026-04-27"
---
# React 폼 제어

React에서 폼(form) 요소를 제어하는 방법은 크게 **제어 컴포넌트(Controlled Component)**와 **비제어 컴포넌트(Uncontrolled Component)** 두 가지로 나뉜다. 제어 방식은 상태가 React state로 관리되어 모든 입력이 리렌더링을 유발하는 반면, 비제어 방식은 DOM이 직접 값을 관리한다. **React Hook Form**은 비제어 컴포넌트 방식을 기반으로 하여 불필요한 리렌더링을 최소화하면서도 선언적인 유효성 검증 API를 제공하는 라이브러리다.

**React Hook Form**을 채택하는 주요 이유는 세 가지다. 첫째, 외부 종속성이 없는 경량 라이브러리라는 점, 둘째, 재렌더링 횟수를 최소화해 성능이 안정적이라는 점, 셋째, TypeScript를 기본으로 지원한다는 점이다.

## 핵심 내용

- **`useForm` hook**: 폼 전체의 상태와 메서드를 제공하는 진입점. `register`, `handleSubmit`, `watch`, `reset`, `control`, `formState` 등을 반환한다.
- **`register`**: 입력 요소를 폼에 등록하는 함수. 첫 번째 인자로 고유 필드명, 두 번째 인자로 유효성 검증 옵션(required, pattern, min/max, maxLength, validate, valueAsNumber 등)을 객체로 전달한다.
- **`formState.errors`**: 유효성 검증 실패 시 오류 정보를 담는 객체. register 옵션에 `value`와 `message`를 함께 전달하면 오류 종류별로 안내 문구를 동적으로 표시할 수 있다.
- **`watch`**: 특정 필드 또는 전체 필드 값을 실시간으로 구독한다. submit 버튼 활성화 조건 체크, 입력값에 따른 조건부 UI 노출 등에 활용한다. `mode: 'onChange'`와 함께 쓰면 입력할 때마다 유효성 검증이 실행된다.
- **`handleSubmit`**: 유효성 검증을 모두 통과한 데이터를 콜백으로 전달하는 submit 핸들러 래퍼.
- **`reset`**: 폼 상태를 초기값으로 되돌린다. submit 성공 후 페이지 새로 고침 없이 폼을 비워야 할 때 사용한다.
- **`Controller` / `useController`**: 외부 UI 라이브러리처럼 내부적으로 `ref`를 직접 다루기 어려운 컴포넌트를 폼에 통합할 때 사용한다. `Controller`는 폼 요소를 감싸는 래퍼 컴포넌트이고, `useController`는 `useForm`과 `Controller` 기능을 합친 hook이다. `field.onChange`와 `field.value`를 구조 분해해 직접 컴포넌트에 연결한다.

## 관련 개념
- [[React 상태 관리]] — React Hook Form은 폼 전용 상태 관리를 제공해 전역 상태와 역할을 분리
- [[React 컴포넌트 패턴]] — Controller 패턴은 외부 컴포넌트와의 통합 방법으로 연결
- [[React TypeScript 패턴]] — TypeScript와 결합 시 register 필드명과 formState 타입이 자동 추론됨

## 출처
- [React 폼 요소 제어하기](https://story.pxd.co.kr/1732) — 2023-11-16, seonju.lee
