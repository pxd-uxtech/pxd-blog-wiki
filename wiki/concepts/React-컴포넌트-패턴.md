---
type: concept
domain: "웹 개발"
name: "React 컴포넌트 패턴"
sources: ["/1824", "/1646"]
updated: "2026-04-07"
---
# React 컴포넌트 패턴

**디자인 패턴**은 소프트웨어 설계에서 자주 발생하는 문제를 해결하기 위한 **재사용 가능한 모범 설계 구조**다. React에서는 컴포넌트의 **재사용성·가독성·확장성**을 높이기 위해 여러 패턴이 존재한다.

## Container / Presentational Pattern

**컨테이너-프레젠테이셔널 패턴**은 컴포넌트를 두 종류로 분리한다.
- **Container 컴포넌트**: 애플리케이션 상태 관리, 데이터 fetch, 이벤트 처리 — **로직 담당**
- **Presentational 컴포넌트**: UI 렌더링, 스타일·레이아웃 — **표현 담당**

```jsx
// Container
const UserListContainer = () => {
  const [users, setUsers] = useState([]);
  useEffect(() => {
    fetch('/api/users').then(r => r.json()).then(setUsers);
  }, []);
  return <UserList users={users} />;
};

// Presentational
const UserList = ({ users }) => (
  <ul>{users.map(u => <li key={u.id}>{u.name}</li>)}</ul>
);
```

**장점**: 데이터와 UI의 책임이 명확히 분리되어 유지보수·재사용성↑. **단점**: 작은 앱에서는 hook으로 같은 효과를 낼 수 있어 과한 분리가 될 수 있다.

## Compound Pattern

**Compound 패턴**은 하나의 큰 컴포넌트를 **여러 작은 하위 컴포넌트**로 구성하고, **Context API**로 컴포넌트 계층 내 상태와 기능을 공유하는 패턴이다. Modal, Accordion, Tabs 같은 복합 UI 구성에 적합하다.

```jsx
const ModalContext = createContext();
const Modal = ({ children }) => {
  const [isOpen, setIsOpen] = useState(false);
  return (
    <ModalContext.Provider value={{ isOpen, openModal: () => setIsOpen(true), closeModal: () => setIsOpen(false) }}>
      {children}
    </ModalContext.Provider>
  );
};
Modal.OpenButton = ({ children }) => {
  const { openModal } = useContext(ModalContext);
  return <button onClick={openModal}>{children}</button>;
};
// Modal.Content, Modal.CloseButton 동일 패턴

// 사용
<Modal>
  <Modal.OpenButton>Open</Modal.OpenButton>
  <Modal.Content>
    <h1>Hello</h1>
    <Modal.CloseButton>Close</Modal.CloseButton>
  </Modal.Content>
</Modal>
```

**장점**: 상태 로직이 컴포넌트 내부에 캡슐화되어 외부에서 신경 쓸 필요가 없고, **하위 컴포넌트 위치를 자유롭게 배치**할 수 있어 다양한 UI 구성이 가능하다. **Headless UI**(스타일 없는 동작 컴포넌트) 라이브러리에서 핵심 패턴이다.

## HOC (Higher-Order Component) Pattern

**고차 컴포넌트 패턴**은 컴포넌트를 입력받아 **새 컴포넌트를 반환하는 함수**다. 재사용 가능한 로직을 여러 컴포넌트에 주입할 때 유용하다.

```jsx
const withLoading = (WrappedComponent, url) => (props) => {
  const [data, setData] = useState(null);
  useEffect(() => {
    fetch(url).then(r => r.json()).then(setData);
  }, []);
  if (!data) return <div>Loading...</div>;
  return <WrappedComponent {...props} data={data} />;
};

export default withLoading(UserImage, '/api/image');
```

**장점**: 동일 로직을 여러 컴포넌트에 반복 없이 적용. **단점**: **각 인스턴스의 커스터마이징이 어렵고**, hook 등장 이후 대부분의 사용 사례가 custom hook으로 대체됨. 단독 동작 컴포넌트에 적합.

## React 프로젝트의 기본 구조

**Create React App**으로 생성한 기본 프로젝트의 구조는 다음과 같다:

```
my-app/
├── README.md
├── node_modules/        # npm으로 설치된 모듈들
├── package.json         # 의존성과 스크립트 명세
├── public/
│   ├── index.html       # 페이지 템플릿 (이름 변경 금지)
│   └── favicon.ico
└── src/
    ├── index.js         # 자바스크립트 시작점 (이름 변경 금지)
    ├── App.js           # 루트 컴포넌트
    ├── App.css
    └── ...
```

**필수 도구**: ① **Node.js** — 브라우저 밖에서 자바스크립트를 실행하는 런타임. React 앱은 브라우저에서 동작하지만 빌드 도구(**바벨**, **웹팩**)가 Node.js 위에서 동작하므로 필수. ② **IDE**(VS Code 권장).

**설치**: `npx create-react-app ./` — `npx`는 npm registry 패키지를 직접 실행하는 도구로, 글로벌 설치 없이 create-react-app을 실행한다.

**진입점 (`src/index.js`)**: `ReactDOM.createRoot(document.getElementById('root'))`로 'root' id를 가진 DOM 노드를 찾아 컴포넌트를 렌더링한다. **React.StrictMode**는 개발 모드에서만 활성화되며 잠재적 문제(deprecated API 사용, 부수 효과 검사 등)를 경고하지만 프로덕션 빌드에는 영향이 없다.

`package.json`의 `scripts`에 정의된 `start`/`build`/`test`/`eject`는 `npm run` 또는 `npm start`로 실행된다.

## 핵심 내용
- **Container/Presentational**: 로직과 UI의 책임 분리
- **Compound**: Context API + Modal.X 형태로 캡슐화 + 자유로운 자식 배치
- **HOC**: 컴포넌트를 입력받아 새 컴포넌트 반환, 로직 재사용
- 작은 앱에서는 **custom hook**이 Container/HOC를 대체할 수 있음
- Compound는 **Headless UI** 라이브러리의 중심 패턴

## 관련 개념
- [[React TypeScript 패턴]] — React 컴포넌트 타입 정의 패턴
- [[웹 컴포넌트]] — 프레임워크 비종속 컴포넌트와의 비교
- [[디자인 시스템]] — 컴포넌트 패턴이 디자인 시스템 구현에 영향

## 출처
- [React 디자인 패턴](https://story.pxd.co.kr/1824) — hyejun.lee, UX Engineer 이야기
- [React 입문: 설치과정과 기본구조 살펴보기](https://story.pxd.co.kr/1646) — jinahgna, UX Engineer 이야기
