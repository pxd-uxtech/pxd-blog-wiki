---
type: concept
domain: "웹 개발"
name: "AWS VPC 네트워크 기초"
sources: ["/1929"]
updated: "2026-10-13"
---
# AWS VPC 네트워크 기초

**VPC(Virtual Private Cloud)**는 클라우드 안에 논리적으로 분리해 만드는 서비스 전용 가상 네트워크 공간이다. AWS 전체를 하나의 도시로 본다면 VPC는 그 안의 우리 회사만 쓰는 독립된 구역에 해당하며, 서버·데이터베이스·로드 밸런서를 어디에 두고 외부 인터넷과 어떻게 연결할지 설계하는 기본 틀이 된다.

핵심 원칙은 리소스마다 공개 범위가 달라야 한다는 것이다. 로드 밸런서만 외부 요청을 받고, API 서버는 로드 밸런서를 통해서만, 데이터베이스는 API 서버에서만 접근하게 나눈다. 이를 위해 **CIDR**(내부 IP 범위, 예: 10.0.0.0/16)로 주소 체계를 정하고, **Subnet**으로 역할별 구역을 나누며, **Route Table**·**Internet Gateway**·**NAT Gateway**로 트래픽 경로를, **Security Group**·**Network ACL**로 접근 제어를 구성한다.

글은 각 용어를 일상 비유(동네·정문·검문소·심부름 담당자)로 풀어 설명하고, 마지막에 "외부에서 직접 접근해야 하나, 나가는 길이 필요한가, 누가 어떤 포트로 접근하나"라는 질문으로 설계를 점검하라고 제안한다.

## 핵심 내용
- **Public Subnet**: Internet Gateway 경로가 Route Table에 있는 구역. 단, 외부 접근에는 Public IP와 Security Group 포트 허용도 함께 필요하다
- **Private Subnet**: 외부에서 직접 접근 불가한 구역. 애플리케이션 서버·DB·캐시·배치 서버를 두고, 외부로 나갈 때만 **NAT Gateway**를 거친다(들어오는 문은 아님)
- **Security Group**은 리소스 단위 방화벽이며 stateful, **Network ACL**은 Subnet 단위 방화벽이며 stateless
- 여러 **Availability Zone**에 Public/Private Subnet을 나눠 배치해 장애에 대비한다
- 실무 원칙: DB는 Private Subnet, Public Subnet에는 꼭 필요한 리소스(로드 밸런서·Bastion Host)만, 포트는 최소한으로 개방(예: 3306은 API 서버에서만)

## 관련 개념
- [[클라우드 컴퓨팅]] — VPC가 놓이는 IaaS 클라우드 인프라의 배경 개념
- [[웹 아키텍처]] — 웹 서버·API·DB 계층 구조의 기초
- [[프론트엔드 보안]] — 접근 제어·노출 최소화라는 보안 사고방식의 공통점

## 출처
- [VPC](https://story.pxd.co.kr/1929) — 2026-10-12, crsmym
