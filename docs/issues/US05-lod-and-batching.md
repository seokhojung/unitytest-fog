# 제목: US5 - 리소스 최적화(LOD/배칭/스트리핑)

## 배경
- PRD `Technical > 리소스 관리 전략`

## 수용조건(AC)
- Given 씬 내 고폴리곤 모델/원거리 오브젝트
- When 카메라 거리 변화
- Then LOD로 폴리곤 수가 단계적으로 저감, 드로우콜이 기준 이하로 유지된다

## 기술 메모
- LODGroup, Static/Dynamic Batching 검토, Occlusion Culling
- Addressables로 필요 리소스만 로드

## 테스트 관점
- 씬 기준 드로우콜 목표 ≤ N, 메모리 ≤ MMB

## 메타
- 라벨: `performance`, `prd`
- 담당자: @owner
- 마일스톤: <YYYY-MM>
