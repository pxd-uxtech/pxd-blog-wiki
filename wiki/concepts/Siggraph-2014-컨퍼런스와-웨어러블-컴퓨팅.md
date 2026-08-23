---
type: concept
domain: "기술과 사회"
name: "Siggraph 2014 컨퍼런스와 웨어러블 컴퓨팅"
sources: ["/1030"]
updated: "2026-08-24"
---
# Siggraph 2014 컨퍼런스와 웨어러블 컴퓨팅

**Siggraph 2014**(밴쿠버, 5일간)는 컴퓨터 그래픽 분야를 제외하면 **웨어러블 컴퓨팅(Wearable Computing)**과 AR/VR이 가장 많이 다뤄진 주제였다. pxd 참가자는 'The Glass Class: Designing Wearable Interface'(2013 구글 글래스 팀 소속 Mark Billinghurst), 'Put on Your 3D Glasses Now'(릴레이 강연), 'Introduction to 3D Gestural Interface'(Central Florida University Joseph LaViola) 세 개 코스를 수강했다.

**웨어러블 기기의 역사**는 뜻밖에도 1960년대 카지노 갬블러가 룰렛 타이밍 예측과 카드 카운팅을 위해 벨트·신발에 인풋 장치를 단 사례에서 출발한다. 1968년에는 하버드의 **아이반 서덜랜드(Ivan Sutherland)**가 제자 밥 스프로울과 함께 최초의 **HMD(Head Mounted Display)** 'The Sword of Damocles'를 개발했고, 이후 1970년대에는 안경형으로, 1990년대에는 See-through 디스플레이가 접목되며 발전했다. 이 흐름의 중심에는 '웨어러블 컴퓨터의 대부'로 불리는 **스티브 만(Steve Mann)**이 있다. 그는 1980~90년대에 다양한 HMD를 개발했고, MIT에 Wearable Computing Group을 만들어 활동했다. 1997년 컬럼비아 대학의 **Touring Machine**은 See-through 안경으로 실제 풍경 위에 장소 정보를 오버레이하면서도 백팩형 PC를 짊어지고 이동해야 했던 초기 모바일 AR 사례로 소개됐다. 컴퓨터가 [Small, Cheap, Faster, Intimate]해지는 추세 속에 2011년 구글 글래스가 등장하며 웨어러블 시장이 본격적으로 주목받았고, 이후 팔찌·시계 등으로 형태가 다양해졌다.

**기술·입력 장치** 측면에서 웨어러블 기기는 [Intimate, Persistent, Aware, Accessible]한 특성 때문에 Hands Free·Always-On·Environment-Aware·Connected·Attention-Getting·Development Platform이 핵심 키워드로 꼽힌다. HMD는 이미지를 실제처럼 바로 보여주는 **Optical See-through**와 디지털화된 이미지를 보여주는 **Video See-through** 두 방식으로 나뉘며, 목적에 따라 적절한 캘리브레이션 전략을 선택해야 한다. 입력 방식은 별도 장치를 쓰는 **Physical Device**, 제스처·음성으로 입력하는 **Natural Input**, 생리 신호를 이용하는 **Physiological Sensor**로 구분되고, 손목 센서로 손 모양 변화를 감지하거나 피부 센서로 근육 움직임을 인식하는 사례가 소개됐다. 궁극적인 형태는 별도 장치 없이 아이트래킹이나 뇌파 인식만으로 입력하는 것으로 전망됐다. Mark Billinghurst는 입력 장치 설계 시 [Fatigue, Comfort, Interaction on go]를, Joseph LaViola는 미래 성장 키워드로 [Custom Recognition, Ecological Validity, Latency, Context]를 제시했다.

흥미로운 활용 사례로는 **디즈니 DisneyQuest**의 HMD 어트랙션(1996년 '알라딘'이 첫 사례)이 소개됐다. 디즈니는 어트랙션 설계 시 **4 Promise**(Immersive·Interactive·Intuitive·Individualized)와 Simply·Intuitive Navigation·Shared Viewpoint·Physical Interaction·Natural Interaction·Field of view·Head Motion·Shared Audio 등 Design Choices를 중요하게 고려한다고 알려졌다. 의료 분야에서는 LED와 카메라로 눈의 움직임을 측정해 뇌손상 여부를 예측하는 Eye Tracking HMD가, 군사·스포츠 분야에서는 낙하산 훈련·포뮬러 원·스키 시뮬레이션 훈련 사례가 있었다. 일상적 웨어러블로는 심박수·수면시간을 측정하는 핏니스 밴드(푸얼밴드 등)가 이미 대중화됐고, 발표 직전 공개된 애플워치의 반응에 대한 기대도 언급됐다.

마지막으로 Mark Billinghurst가 제시한 **웨어러블 인터페이스 디자인 가이드라인**이 정리됐다. Interaction Design 측면에서는 기기 자체를 위한 설계(단순하고 관련성 높은 정보, 기존 기기 보완, 위치·맥락·시의적 정보에 집중), 몇 초 이내의 마이크로 인터랙션 설계, 읽기가 아닌 인지를 위한 정보 밀도 최소화(**Glanceable**), 한 번에 한 가지만·맥락에 맞게·예상 밖 상황 피하기가 강조됐다. Visual Design 측면에서는 투명 디스플레이 구현의 어려움, 흰색을 기본 배경으로 삼는 관행, 색으로 위계 표현, 브랜드 고유 타이포그래피 사용, 실내·실외 환경 모두에서 테스트할 것이 제안됐다.

## 핵심 내용
- **웨어러블 컴퓨팅의 기원**: 1960년대 카지노 갬블러의 벨트·신발 인풋 장치 → 1968년 서덜랜드의 최초 HMD 'The Sword of Damocles' → 스티브 만(MIT Wearable Computing Group)의 1980~90년대 발전
- **Touring Machine(1997, 컬럼비아대)**: See-through 안경 + 백팩형 PC로 구현한 초기 모바일 AR 사례
- 컴퓨팅 트렌드는 [Small, Cheap, Faster, Intimate] 방향, 2011년 구글 글래스가 웨어러블 시장의 전환점
- 웨어러블 특성 [Intimate, Persistent, Aware, Accessible], HMD는 **Optical See-through** vs **Video See-through**로 구분
- 입력 방식 3분류: **Physical Device / Natural Input / Physiological Sensor**, 궁극적 형태는 아이트래킹·뇌파 인식 기반 무장치화
- **디즈니 DisneyQuest**의 4 Promise(Immersive·Interactive·Intuitive·Individualized)로 본 HMD 어트랙션 설계 원칙
- **Mark Billinghurst의 웨어러블 디자인 가이드라인**: Design for the Device·Micro-Interaction·Glanceable·Do one thing at a time·Avoid the Unexpected (Interaction), 투명 디스플레이 주의·White is your new black·색상 위계·브랜드 타이포·실내외 테스트 (Visual)

## 관련 개념
- [[IoT 제품 디자인]] — 센싱·네트워크·서비스 인터페이스로 사물을 연결하는 웨어러블과 인접한 기술 패러다임
- [[UI와 디바이스 역사]] — 마우스·터치스크린 등 다른 입력 장치의 '최초의 순간'을 다루는 유사한 기술사 정리
- [[아이트래킹]] — 웨어러블 궁극적 입력 방식으로 언급된 시선 추적 기술의 UX 리서치적 적용
- [[모바일 제스처 UI]] — Natural Input 방식의 제스처 기반 입력이라는 공통 주제
- [[CES 2013 컨퍼런스]] — 비슷한 시기 웨어러블·스마트홈 기술 트렌드를 다룬 또 다른 해외 컨퍼런스 참관기
- [[CHI 2015 학회와 HCI 연구 트렌드]] — 학술 관점에서 HCI 연구 트렌드를 다룬 유사한 해외 컨퍼런스 리뷰

## 출처
- [[해외교육] Siggraph 2014 (2/2) Wearable Computing](https://story.pxd.co.kr/1030) — 2015-03-23, 알 수 없는 사용자
