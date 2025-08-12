param(
  [string]$IssuesDir = "docs/issues",
  [string]$Labels = "feature,prd",
  [string]$Repo,
  [string]$Milestone,
  [switch]$DryRun
)

function Ensure-GhCli {
  if (-not (Get-Command gh -ErrorAction SilentlyContinue)) {
    throw "GitHub CLI(gh)가 설치되어 있지 않습니다. https://cli.github.com 에서 설치 후 'gh auth login'을 수행하세요."
  }
}

function Get-TitleFromFile([string]$Path) {
  $lines = Get-Content $Path -Raw -Encoding UTF8 -ErrorAction Stop
  $match = Select-String -InputObject $lines -Pattern "^#\s+(.+)$" -CaseSensitive
  if ($match) { return $match.Matches[0].Groups[1].Value.Trim() }
  return [System.IO.Path]::GetFileNameWithoutExtension($Path)
}

function New-GhIssueFromFile([string]$Path) {
  $title = Get-TitleFromFile -Path $Path
  $body = Get-Content $Path -Raw -Encoding UTF8
  $args = @("issue", "create", "--title", $title, "--body", $body, "--label", $Labels)
  if ($Repo) { $args += @("-R", $Repo) }
  if ($Milestone) { $args += @("--milestone", $Milestone) }
  if ($DryRun) {
    Write-Host "[DRYRUN] gh $($args -join ' ')"
  } else {
    gh @args | Write-Host
  }
}

try {
  Ensure-GhCli
  if (-not (Test-Path $IssuesDir)) { throw "Issues 디렉토리를 찾을 수 없습니다: $IssuesDir" }
  $files = Get-ChildItem -Path $IssuesDir -Filter *.md -File -Recurse |
           Where-Object { $_.Name -notmatch "ISSUE_TEMPLATE" }
  if (-not $files) { throw "생성할 이슈 파일(.md)이 없습니다. $IssuesDir 를 확인하세요." }
  foreach ($f in $files) {
    Write-Host "Creating issue from: $($f.FullName)" -ForegroundColor Cyan
    New-GhIssueFromFile -Path $f.FullName
  }
  Write-Host "Done." -ForegroundColor Green
} catch {
  Write-Error $_
  exit 1
}


