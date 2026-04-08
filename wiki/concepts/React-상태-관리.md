---
type: concept
domain: "웹 개발"
name: "React 상태 관리"
sources: ["/1693"]
updated: "2026-04-07"
---
# React 상태 관리

**React 상태 관리(State Management)**는 컴포넌트 트리 전반에 걸친 데이터 흐름을 제어하는 문제다. `useState`와 Context API만으로 처리할 수도 있지만, 컴포넌트 트리가 깊어지고 prop drilling(데이터를 여러 단계의 자식 컴포넌트로 전달)이 심해지면 별도 상태 관리 라이브러리가 필요해진다. 대표적으로 **Redux**, **MobX**, **Recoil**, **Jotai**, **Zustand** 등이 있다.

**Jotai**는 일본어로 "상태"를 뜻하며, **Recoil**에서 영감을 받은 **아토믹(atomic) 상태 관리 라이브러리**다. 핵심 개념은 다음과 같다.

- **atom**: 가장 작은 단위의 상태 조각으로, `atom(initialValue)`으로 정의한다. 컴포넌트 외부에서 `export`해 어디서든 import 가능하다.
- **useAtom**: `useState`처럼 `[value, setValue]` 튜플을 반환한다.
- **useAtomValue**: 값만 읽기(read) — 값이 바뀔 때만 리렌더링.
- **useSetAtom**: 값만 쓰기(write) — 리렌더링이 발생하지 않아 성능 최적화에 유리.

```jsx
import { atom, useAtom } from 'jotai';
const countAtom = atom(0);
function Counter() {
  const [count, setCount] = useAtom(countAtom);
  return <button onClick={() => setCount(c => c + 1)}>{count}</button>;
}
```

**Jotai의 장점**: 최소한의 API, TypeScript 기본 내장, 작은 번들 크기, **bottom-up 아토믹 모델**(아톰 의존성에 따라 렌더링 최적화), Context API의 리렌더링 이슈 회피, Next.js·React Native 지원. **단점**: 러닝 커브를 깊이 파고들면 내부 구조와 최적화가 단순하지 않으며, React 전용이다.

**언제 사용하면 좋은가**: 작은~중간 규모 프로젝트에서 Redux/MobX의 보일러플레이트가 부담스럽고, `useState`+Context로는 부족할 때 적합하다. Immer와 함께 사용하면 불변성을 유지하면서도 가독성 높은 코드를 작성할 수 있다.

## 핵심 내용
- prop drilling 해소를 위한 전역 상태 관리는 깊은 컴포넌트 트리의 필수 도구
- **Jotai**: bottom-up 아토믹 모델, Recoil 영감, React 전용
- `useAtom`/`useAtomValue`/`useSetAtom`로 read/write 분리 → 불필요한 리렌더링 방지
- atom은 컴포넌트 외부에서 export 가능 → 어디서든 import해 사용
- 작은 규모, 단순한 API 선호 시 Redux보다 적합
- 대안: Redux(엔터프라이즈), MobX(반응형), Zustand(미니멀), Recoil(Meta)

## 관련 개념
- [[React 컴포넌트 패턴]] — 상태 관리는 컴포넌트 설계 패턴과 직결
- [[React TypeScript 패턴]] — TypeScript와 결합하면 atom 타입 안전성 확보

## 출처
- [Jotai (리액트 상태관리를 쉽게)](https://story.pxd.co.kr/1693) — crsmym, UX Engineer 이야기
