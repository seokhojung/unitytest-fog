# 제목: US1 - 플랫폼별 입력/조작 체계 구현 (VR/모바일/PC/WebGL)

## 배경
- PRD `Scope > 플랫폼별 차별화 기능` 요구 반영

## 수용조건(AC)
- Given 프로젝트가 각 플랫폼 타깃으로 빌드될 때
- When 사용자가 해당 플랫폼의 기본 입력 장치로 조작할 경우
- Then 아래 동작이 일관되고 튜토리얼 없이 이해 가능해야 한다
  - VR: 6DoF 컨트롤러 이동/시점 조작(워킹/텔레포트 정책 결정)
  - 모바일: 터치 이동/시점, 감도 설정, 저해상도 모드 토글
  - PC: WASD+마우스 기본, 감도/키맵 설정
  - WebGL: 키보드/마우스 최소 조작 + 버튼 UI 간소화

## 기술 메모
- XR Interaction Toolkit(OpenXR) 통합, 새 Input System 맵핑 분기
- `InputSystem_Actions.inputactions` 플랫폼별 Action Map 검토/확장

## 테스트 관점
- 플랫폼별 조작 튜토리얼 1분 내 학습 가능성
- 시점 전환 시 어지럼증 유발 요소 최소화 체크

## 메타
- 라벨: `feature`, `prd`
- 담당자: @owner
- 마일스톤: <YYYY-MM>
