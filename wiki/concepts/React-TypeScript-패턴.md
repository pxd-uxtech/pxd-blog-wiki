---
type: concept
domain: "웹 개발"
name: "React TypeScript 패턴"
sources: ["/1650"]
updated: "2026-04-06"
---
# React TypeScript 패턴

**React**와 **TypeScript**를 함께 사용할 때 발생하는 타입 정의 패턴과 주의사항을 다룬다. 특히 함수형 컴포넌트의 타입 정의 방식으로 널리 쓰이던 `React.FC`(Function Component)가 최근 **권장되지 않는 방향**으로 흐름이 바뀌었다.

`React.FC`의 문제점은 세 가지다. 첫째, **defaultProps 처리 어려움**: `React.FC`로 선언된 컴포넌트에서 `defaultProps`가 TypeScript와 함께 제대로 동작하지 않아 기본값 추론에 문제가 생긴다. 둘째, **암시적 children**: React 18 이전에는 `React.FC`가 자동으로 `children` prop을 포함시켰는데, 이로 인해 `children`을 받을 의도가 없는 컴포넌트도 `children`을 허용하게 되어 타입 안전성이 낮아졌다. React 18에서는 이 암시적 `children`이 제거되었다. 셋째, **제네릭 컴포넌트 제약**: `React.FC`와 화살표 함수를 같이 쓰면 TSX 파일에서 제네릭 문법 파싱 충돌이 발생할 수 있다.

현재 권장되는 방식은 **일반 함수 선언**으로 컴포넌트를 정의하고, 반환 타입은 TypeScript가 추론하도록 두거나 `JSX.Element`를 명시하는 것이다. Props 타입은 별도 `interface`나 `type`으로 정의하고 함수 매개변수에 직접 적용한다. `children`이 필요한 경우 `React.PropsWithChildren<Props>` 또는 `children: React.ReactNode`를 명시적으로 선언한다.

**Create React App(CRA)** 기본 템플릿이 `React.FC`를 사용하면서 이 패턴이 광범위하게 퍼졌지만, **react-typescript-cheatsheet** 커뮤니티를 중심으로 일반 함수 방식으로의 전환이 권장되고 있다.

## 핵심 내용
- `React.FC` 사용 자제 권고: defaultProps 문제, 암시적 children, 제네릭 제약
- React 18에서 `React.FC`의 암시적 `children: ReactNode` 포함이 공식 제거됨
- 권장 패턴: 일반 함수 선언 + Props interface 분리 + 반환 타입 추론
- `children` 필요 시 `React.PropsWithChildren<T>` 또는 `children: React.ReactNode` 명시
- CRA 기본 템플릿의 `React.FC` 사용이 잘못된 관행을 확산시킨 주요 원인

## 관련 개념
- [[JavaScript Date 라이브러리]] — TypeScript와 함께 활용하는 날짜 라이브러리
- [[PWA 프로그레시브 웹 앱]] — React 기반 PWA 구현에서의 타입 안전성
- [[웹 개발 아키텍처]] — 프론트엔드 컴포넌트 설계와 아키텍처의 연관

## 출처
- [React.FC에 대하여](https://story.pxd.co.kr/1650) — 2022-12-12, 알 수 없는 사용자
