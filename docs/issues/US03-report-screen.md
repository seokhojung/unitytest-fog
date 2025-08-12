# 제목: US3 - 결과 리포트 화면 구현(JSON 스키마)

## 배경
- PRD `Scope > 결과 리포트 화면`, `Technical > 결과 리포트 JSON`

## 수용조건(AC)
- Given 교육 세션 종료 시점
- When 결과 화면 진입
- Then 점수/이수/오류 사례/리트라이 권고가 JSON 스키마를 통해 표시된다

## 기술 메모
- JSON 스키마 초안: `{ sessionId, userId?, scenarioId, metrics:{score,fpsAvg,errors[]}, timestamp }`
- i18n 적용, 인쇄/저장 지원

## 테스트 관점
- 샘플 JSON으로 렌더링 테스트
- 엣지 케이스(데이터 누락, null, 배열 빈값) 렌더링 안전성

## 메타
- 라벨: `feature`, `report`, `prd`
- 담당자: @owner
- 마일스톤: <YYYY-MM>
