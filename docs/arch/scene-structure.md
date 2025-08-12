# 씬 구조 초안(BOOT → MAIN → REPORT)

## 목표
- 로딩/자원 관리, 시나리오 수행, 결과 리포트를 분리하여 성능과 유지보수 용이성 확보

## 씬 구성
- Boot
  - 앱 초기화, 품질/플랫폼 설정, Addressables 초기화, 프로파일러 훅 설치
  - 다음 씬(메인) 로드 전 스플래시/프로그레스 표시
- Main
  - 12개 시나리오 관리(공통 템플릿 기반)
  - 입력(플랫폼 분기), 360 플레이어, 리소스 로드/해제
  - 완료/중단 시 결과 데이터 수집 → Report로 전달
- Report
  - 결과 JSON 렌더링, 저장/업로드, 인쇄/공유 옵션

## 씬 전이
- Boot → Main: Addressables 초기화 완료 후 비동기 로드
- Main → Report: 완료 데이터(JSON) 전달, 리소스 해제

## 폴더 구조 권장
- `Assets/Scenes/Boot.unity`
- `Assets/Scenes/Main.unity`
- `Assets/Scenes/Report.unity`
- `Assets/_Shared/Prefabs`, `Assets/_Shared/Scripts`


