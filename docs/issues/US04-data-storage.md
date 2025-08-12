# 제목: US4 - 로컬/클라우드 저장(HTTPS + AES256)

## 배경
- PRD `Scope > 교육 데이터 로컬/클라우드`, `Technical > HTTPS + AES256, 익명화`

## 수용조건(AC)
- Given 결과 데이터(JSON)
- When 로컬 저장 혹은 서버 업로드 설정이 활성화일 때
- Then HTTPS로 전송되고, 민감정보는 익명화되며 저장 시 AES256 암호화된다

## 기술 메모
- 로컬: Application.persistentDataPath + 암호화
- 클라우드: REST API 모듈(리트라이/백오프), 키 관리
- PII 필드 마스킹/해시

## 테스트 관점
- 전송 패킷 스니핑 시 평문 노출 없음
- 장애 시 재시도 및 사용자 피드백

## 메타
- 라벨: `feature`, `security`, `prd`
- 담당자: @owner
- 마일스톤: <YYYY-MM>
