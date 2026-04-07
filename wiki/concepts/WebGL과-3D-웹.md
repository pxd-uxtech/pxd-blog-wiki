---
type: concept
domain: "웹 개발"
name: "WebGL과 3D 웹"
sources: ["/1643", "/1771"]
updated: "2026-04-07"
---
# WebGL과 3D 웹

**WebGL(Web Graphics Library)**은 웹 브라우저에서 2D 및 3D 그래픽을 렌더링하기 위한 저수준 JavaScript API다. **OpenGL ES 2.0**을 기반으로 하며 HTML5 `<canvas>` 요소 안에서 동작한다. Canvas는 원래 2D 그래픽 위젯과 Apple 애플리케이션을 위해 도입되었으나, WebGL의 등장으로 브라우저에서 복잡한 3D 게임과 고급 그래픽 애플리케이션 구현이 가능해졌다.

**Babylon.js**는 Microsoft 개발자들이 만들어 2015년 컨퍼런스에서 공개한 HTML5 웹 렌더링 엔진이다. WebGL API를 직접 다루지 않아도 3D·2D 그래픽을 개발할 수 있도록 추상화 계층을 제공한다. 공식 사이트의 **Playground** 기능을 통해 JavaScript나 TypeScript로 코드를 작성하고 즉시 결과를 확인할 수 있어 학습 진입 장벽이 낮다.

Babylon.js의 핵심 구성 요소는 네 가지다. **Scene**은 캔버스 렌더링 환경을 초기화하는 최상위 컨테이너다. **Camera**는 필수 선언 요소로 FreeCamera 외에도 다양한 유형을 지원한다. **Light**는 3D 모델의 다양한 면을 표현하며 여러 종류의 조명 효과를 제공한다. **MeshBuilder**는 기본 내장 도형을 생성하고, `SceneLoader.ImportMesh`로 외부 3D 모델을 불러온다. **Sketchfab** 같은 플랫폼에서 무료 3D 모델을 다운로드해 활용할 수 있으며, 이벤트와 리깅된 애니메이션으로 동적 효과를 만들 수 있다.

WebGL은 역사가 길지만 웹 서비스에서의 실제 채택률은 아직 낮은 편이다. 퍼포먼스 이슈와 대용량 파일 크기가 주요 원인으로 꼽히며, 게임·전시·커뮤니티 플랫폼 등 몰입형 경험이 필요한 분야에서 점차 도입이 늘고 있다.

**React Three Fiber(RTF)**는 WebGL 기반의 **three.js**를 React 환경에서 컴포넌트 방식으로 사용할 수 있게 해주는 라이브러리다. three.js는 단순한 mesh 하나를 만드는 데도 Scene·Camera·Renderer·Mesh·Material을 하나씩 선언해야 해 코드량이 많고 가독성이 떨어지지만, RTF는 `<Canvas>` 안에 `<mesh><boxGeometry /><meshStandardMaterial /></mesh>` 형태로 **카멜 케이스 태그**를 사용해 간결하게 작성한다. `useFrame`·`useLoader` 같은 훅도 제공해 React 개발자의 러닝 커브를 낮춘다. 또한 리렌더링과 언마운트 시 **메모리 정리를 자동 처리**하며 Next.js SSR과도 호환된다(`transpilePackages: ['three']` 설정 필요).

RTF 생태계에는 다양한 헬퍼 라이브러리가 있다. **@react-three/drei**는 자주 쓰는 기능(기본 mesh, 카메라, 셰이더, 컨트롤)을 미리 구현해 3D 개념이 익숙하지 않은 개발자도 쉽게 접근할 수 있게 한다. **@react-three/gltfjsx**는 **glTF(GL Transmission Format)** 3D 모델을 jsx 형태로 간편하게 사용하도록 돕고, **@react-three/postprocessing**(노이즈·비네팅), **@react-three/flex**(CSS flex 배치) 등이 결과물 퀄리티와 생산성을 동시에 높인다.

## 핵심 내용
- **WebGL**: OpenGL ES 2.0 기반, HTML5 Canvas에서 동작하는 3D 그래픽 API
- **Babylon.js**: Microsoft 개발, WebGL 추상화로 복잡한 API 없이 3D 개발 가능
- **three.js**: WebGL을 감싼 대표적 JS 3D 라이브러리, 낮은 수준의 세팅 필요
- **React Three Fiber(RTF)**: three.js를 React 컴포넌트 방식으로 사용, 자동 메모리 관리·SSR 지원
- 4대 구성 요소(Babylon.js): Scene · Camera · Light · MeshBuilder
- RTF 생태계: **drei**(헬퍼 컴포넌트), **gltfjsx**(glTF 모델), **postprocessing**(후처리), **flex**(레이아웃)
- Playground에서 코드 작성 → URL 자동 생성 → 로컬 다운로드로 이어지는 개발 흐름
- 웹 서비스 채택률은 아직 낮으나 게임·전시·커뮤니티 분야에서 성장 중

## 관련 개념
- [[PWA 프로그레시브 웹 앱]] — 웹 기술의 경계를 확장하는 또 다른 접근법
- [[웹 아키텍처]] — 3D 웹 콘텐츠를 서비스하기 위한 서버 구조 이해

## 출처
- [Babylonjs 다뤄보기](https://story.pxd.co.kr/1643) — 2022-09-15, crsmym
- [React Three Fiber](https://story.pxd.co.kr/1771) — hongdoyoung, UX Engineer 이야기
