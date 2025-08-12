# 텔레메트리 이벤트 설계 초안

## 공통 컨텍스트
- appVersion, platform, deviceModel, sessionId, userAnonId

## 이벤트 목록(초안)
- app_start { ts }
- scene_loaded { sceneName, ts, loadMs }
- video_started { id, quality, ts }
- video_buffering { id, reason, bufferingMs, ts }
- video_ended { id, durationMs, ts }
- scenario_started { scenarioId, ts }
- scenario_completed { scenarioId, score, errors[], ts }
- report_saved { sizeBytes, path, ts }
- data_upload_succeeded { bytes, ts }
- data_upload_failed { error, ts }

## 전송
- 로컬 로그 + 선택적 HTTPS 업로드(큐/리트라이)


