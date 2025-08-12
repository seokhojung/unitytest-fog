# 제목: US6 - 텍스처 압축(BC7/ASTC) 파이프라인

## 배경
- PRD `Technical > 텍스처 압축`

## 수용조건(AC)
- Given 플랫폼 타깃 빌드
- When 텍스처 임포트/빌드
- Then PC는 BC7, 모바일은 ASTC 등 최적 포맷으로 빌드되고 아티팩트 최소화

## 기술 메모
- 임포트 설정 프리셋, 플랫폼 오버라이드 자동화

## 테스트 관점
- 텍스처 품질 시각 비교, VRAM 사용량 리포트

## 메타
- 라벨: `performance`, `build`, `prd`
- 담당자: @owner
- 마일스톤: <YYYY-MM>
