# 제목: US9 - 성능 예산 수립 및 자동 측정(FPS/로딩/응답)

## 배경
- PRD `NFR > 플랫폼별 성능 목표`

## 수용조건(AC)
- Given 각 플랫폼 대상 실행
- When 핵심 경로 수행
- Then VR 72FPS, PC 60FPS, 모바일 30FPS, WebGL 초기로딩 ≤5초/응답 ≤200ms 충족

## 기술 메모
- Unity Profiler, FrameTiming, 로딩 지표 계측 코드

## 테스트 관점
- 자동화 스크립트로 주간 리포트 산출

## 메타
- 라벨: `performance`, `nfr`, `prd`
- 담당자: @owner
- 마일스톤: <YYYY-MM>
