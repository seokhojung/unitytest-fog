---
title: "BMAD METHOD PRD v1.1 – 개선 반영 버전"
owner: "<PM/팀>"
status: "Draft"
milestone: "<YYYY-MM>"
kpi: ["<핵심 KPI 1>", "<핵심 KPI 2>"]
---

# BMAD METHOD PRD v1.1 – 개선 반영 버전

## 1. Overview / 프로젝트 개요
(동일 – v1.0 참조)

---

## 2. Scope

### In Scope
- (추가) 플랫폼별 차별화 기능
  - **VR**: 6DoF 컨트롤러 기반 이동/시점 조작
  - **모바일**: 터치 UI, 기기 성능에 맞춘 저해상도 모드
  - **PC**: 마우스/키보드, 고해상도 옵션
  - **WebGL**: 버튼 UI 최소화, 영상 스트리밍 로딩
- Unity URP 기반 3D 씬
- XR Interaction Toolkit + OpenXR Plugin
- 12개 사고 시나리오 구현
- 360도 영상 재생(실사/CG)
- 결과 리포트 화면
- 교육 데이터 로컬/클라우드 저장

### Out of Scope
- 멀티플레이어, AR, 음성 인식

---

## 3. Technical Requirements (강화)
- **리소스 관리 전략**
  - 3D 모델 LOD(레벨 오브 디테일) 적용
  - 텍스처 압축(BC7, ASTC)
  - 영상은 H.265로 인코딩, 스트리밍 재생
  - WebGL 빌드 크기 ≤ 200MB
- **데이터 처리**
  - 결과 리포트 JSON 포맷
  - 클라우드 저장 시 HTTPS + 암호화(AES256)
  - 개인정보(이름, 나이 등)는 익명화 처리

---

## 4. Non-Functional Requirements (보강)
- **플랫폼별 성능 목표**
  - VR: 72FPS 이상
  - 모바일: 30FPS 이상
  - PC: 60FPS 이상
  - WebGL: 초기 로딩 ≤ 5초, 인터랙션 응답 ≤ 200ms
- **접근성**
  - 모든 영상에 자막 제공
  - 색약 모드(UI 대비 강화)

---

## 5. QA / Testing Plan (신규)
- **테스트 환경 목록**
  - VR: Meta Quest 2/3
  - 모바일: Android(중·고사양), iOS(iPhone 12 이상)
  - PC: Windows 10/11, MacOS Ventura 이상
  - 브라우저: Chrome, Edge, Safari
- **테스트 시나리오**
  - 기능별: 메뉴, 시나리오 로딩, 영상 재생, 시점 전환
  - 성능: FPS, 로딩 시간 측정
  - 보안: 데이터 전송 암호화 검증

---

## 6. Acceptance Criteria (보강)
- 모든 플랫폼에서 FPS·로딩 목표 충족
- 각 시나리오에서 영상 재생·종료·리포트 기능 정상 작동
- 결과 데이터가 정확히 저장·조회됨
- UI가 접근성 가이드 준수

---

## 7. Risks & Mitigation (보강)
- **RISK-04**: 모바일·WebGL에서 용량 초과 → LOD·압축 강화
- **RISK-05**: 플랫폼별 성능 불균형 → 사전 최적화 + 플랫폼별 품질 설정
- **RISK-06**: 클라우드 저장 시 개인정보 유출 → 암호화 + 익명화 처리
