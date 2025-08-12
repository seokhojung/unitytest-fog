## 스크립트 사용법

### 1) PRD에서 사용자 스토리 파일 생성

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\scripts\split_prd_into_issues.ps1 -PrdPath .\docs\prd\PRD_DRAFT.md -OutDir .\docs\issues
```

옵션:
- `-Overwrite`: 기존 US*.md 덮어쓰기
- `-DryRun`: 파일 생성 없이 미리보기

### 2) 사용자 스토리 파일들로 GitHub 이슈 생성

사전 준비: GitHub CLI 설치 및 로그인

```powershell
gh --version
gh auth login
```

실행:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\scripts\create_issues.ps1 -IssuesDir .\docs\issues -Labels "feature,prd" -Repo "<owner>/<repo>" -Milestone "<YYYY-MM>"
```

옵션:
- `-DryRun`: 실제 이슈 생성 없이 커맨드 미리보기


