---
type: concept
domain: "AI와 신기술"
name: "LangChain과 LLM 개발"
sources: ["/1850"]
updated: "2026-04-07"
---
# LangChain과 LLM 개발

**LangChain(랭체인)**은 다양한 언어 모델을 쉽게 연결해 자연어 처리 기반 애플리케이션을 구축할 수 있게 도와주는 **오픈소스 라이브러리**다. LLM·도구·API·데이터베이스를 일관된 방식으로 결합해 복잡한 AI 서비스를 모듈식으로 구축할 수 있다. 요리에 비유하면 여러 재료(데이터)와 도구(LLM), 요리법(프롬프트)을 연결해주는 **스마트 주방 도우미**와 같다.

**LangChain의 6가지 주요 구성 요소**:
1. **LLM 추상화(Abstraction)** — 내부 구조를 몰라도 여러 언어 모델을 쉽게 사용. GPT-3.5, GPT-4, Llama 등을 필요에 따라 교체 가능.
2. **프롬프트 템플릿(Prompts)** — 구조화된 프롬프트 작성으로 정형화된 명령을 쉽게 구성.
3. **체인(Chains)** — 여러 LLM 호출·검색·분석 단계를 순서대로 연결해 복잡한 워크플로우 처리.
4. **인덱스(Indexes)** — 외부 문서를 로딩·분할·벡터 DB에 저장해 효율적 검색과 응답 품질 향상.
5. **메모리(Memory)** — 대화 맥락을 저장해 LLM에 지속 기억력을 부여.
6. **에이전트(Agents)** — LLM이 스스로 도구(API·검색·DB)를 선택해 작업 수행하는 능력.

**RAG(Retrieval-Augmented Generation)**는 LangChain의 대표 활용 패턴이다. 사용자 질문과 관련된 데이터를 외부에서 검색해 답변 정확성을 높이는 기술로, LangChain은 RAG의 각 단계—**Document Loader**(PDF/웹/텍스트 로딩) → **Text Splitter**(적절한 크기로 분할) → **Embedding**(벡터화) → **Vector Store**(Chroma 등에 저장) → **Retrieval**(유사도 기반 검색) → **Generation**(LLM 답변 생성)—를 쉽게 연결할 수 있는 빌딩 블록을 제공한다.

**활용 영역**: 대화 맥락을 기억하는 **챗봇**, 긴 **문서 요약과 Q&A 시스템**, 특정 주제의 **콘텐츠 생성**, 복잡한 데이터를 분석해 인사이트를 제공하는 **데이터 분석 보조**, 이메일·일정·정보 검색을 돕는 **개인 비서** 앱 등. Python 생태계와 가장 잘 통합되어 있지만 **langchain.js**를 통해 Node/JavaScript 진영에서도 활용 가능하다.

## 핵심 내용
- **LangChain**: LLM 애플리케이션을 위한 오픈소스 빌딩 블록 프레임워크
- 6대 구성: **LLM 추상화 · 프롬프트 · 체인 · 인덱스 · 메모리 · 에이전트**
- **RAG**: Document Loader → Splitter → Embedding → Vector Store → Retrieval → Generation
- 여러 LLM을 쉽게 교체 가능, 프롬프트와 체인의 재사용성·유지보수성 향상
- Python 기반이 메인이나 **langchain.js**로 JS 생태계도 지원
- 챗봇·RAG Q&A·콘텐츠 생성·데이터 분석·개인 비서 등 폭넓은 활용

## 관련 개념
- [[MCP 모델 컨텍스트 프로토콜]] — LLM-외부 시스템 연결의 표준 프로토콜
- [[AI 코딩 도구 활용]] — 개발 환경에서 LLM 활용
- [[텍스트 임베딩과 데이터 시각화]] — RAG의 임베딩 단계와 연결
- [[AI 모더레이터와 UX 리서치]] — LLM 기반 리서치 도구와의 관계

## 출처
- [LangChain(랭체인)](https://story.pxd.co.kr/1850) — crsmym, UX Engineer 이야기
