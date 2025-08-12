# 제목: US8 - WebGL 빌드 크기 ≤ 200MB 달성

## 배경
- PRD `Technical > WebGL 빌드 크기 ≤ 200MB`

## 수용조건(AC)
- Given WebGL 빌드 생성
- When 압축/스트리핑/어드레서블 분리 적용
- Then 빌드 산출물(압축 기준)이 200MB 이하

## 기술 메모
- Asset stripping, Code stripping, Brotli/Gzip 설정

## 테스트 관점
- 로딩 시간/다운로드 크기 측정 리포트

## 메타
- 라벨: `build`, `webgl`, `prd`
- 담당자: @owner
- 마일스톤: <YYYY-MM>
