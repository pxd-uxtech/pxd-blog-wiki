---
type: concept
domain: "웹 개발"
name: "XAML과 WPF"
sources: ["/1624"]
updated: "2026-07-11"
---
# XAML과 WPF

**XAML**(Extensible Application Markup Language)은 닷넷 프레임워크 기반의 UI 마크업 언어로, **WPF**(Windows Presentation Foundation)와 윈도 워크플로 파운데이션(WF)에서 널리 쓰인다. HTML이 웹페이지의 UI 요소를 구조화하듯, XAML은 C# 기반 윈도우 데스크톱 애플리케이션의 UI 요소·데이터 바인딩·이벤트를 정의하는 역할을 맡는다. 즉 XAML이 디자인(마크업) 영역을, C#이 로직 영역을 담당하는 구조로, 웹 개발에서 HTML/CSS와 자바스크립트가 분리되는 관계와 유사하다.

**WPF**는 MS가 만든 데스크톱 애플리케이션용 GUI 프레임워크로, 이전 세대인 **WinForm**(Windows Forms)의 단점을 보완하기 위해 등장했다. 개선점 중 하나가 XAML을 통해 디자인 영역과 개발 영역을 웹처럼 분리한 것이며, 이 분리 덕분에 업무 분담이 가능해지고 더 다양하고 정교한 UI 구현이 가능해졌다고 이해된다. WPF는 Windows 환경 전용으로, macOS에서는 지원되지 않는다.

실무에서 XAML을 다뤄본 경험에 비추어 보면, 이는 순수 마크업 언어라기보다 HTML+CSS+약간의 자바스크립트가 결합된 형태에 가깝다. 개발 환경 구성은 Visual Studio Community를 설치하고 ".NET 데스크톱 개발" 워크로드를 체크한 뒤, XAML 기반 WPF 앱(.NET Framework) 프로젝트를 생성하는 방식으로 이뤄진다.

## 핵심 내용
- XAML은 닷넷 기반 UI 마크업 언어로 WPF·WF에서 사용됨
- HTML이 웹 UI를 구조화하듯 XAML은 C# 기반 데스크톱 앱 UI를 구조화
- WPF는 WinForm의 후속 GUI 프레임워크로, XAML을 통해 디자인/개발 영역을 분리
- Windows 전용이며 macOS는 미지원
- 실무 체감상 HTML+CSS+약간의 JS가 결합된 형태에 가까움
- 개발 환경: Visual Studio + .NET 데스크톱 개발 워크로드 설치 필요

## 관련 개념
- [[Vue3 마이그레이션]] — 마크업과 로직을 분리하는 다른 UI 프레임워크의 구조 변화 사례
- [[React 컴포넌트 패턴]] — 웹 진영에서 UI 마크업과 로직을 구성하는 대응 개념

## 출처
- [헬로 XAML #1](https://story.pxd.co.kr/1624) — 2022-05-09, hyejun.lee
