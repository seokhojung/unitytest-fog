param(
  [Parameter(Mandatory=$true)][string]$PrdPath,
  [string]$OutDir = "docs/issues",
  [switch]$Overwrite,
  [switch]$DryRun
)

if (-not (Test-Path $PrdPath)) { throw "PRD 파일을 찾을 수 없습니다: $PrdPath" }
if (-not (Test-Path $OutDir)) { New-Item -ItemType Directory -Path $OutDir -Force | Out-Null }

$content = Get-Content $PrdPath -Raw -Encoding UTF8
$lines = $content -split "`n"

# 패턴: "- US1: 요약" 또는 "- US: 요약"
$pattern = '^\s*-\s*US(?<num>\d*)\s*[:\-]\s*(?<summary>.+)$'
$matches = @()
for ($i = 0; $i -lt $lines.Length; $i++) {
  $m = [regex]::Match($lines[$i], $pattern)
  if ($m.Success) {
    $obj = [PSCustomObject]@{
      Index = $matches.Count + 1
      Number = if ($m.Groups['num'].Value) { [int]$m.Groups['num'].Value } else { $null }
      Summary = $m.Groups['summary'].Value.Trim()
    }
    $matches += $obj
  }
}

if (-not $matches) { throw "PRD에서 사용자 스토리(US)를 찾지 못했습니다. '기능 요구사항' 섹션의 '- US1: 요약' 형식을 확인하세요." }

foreach ($us in $matches) {
  $n = if ($us.Number) { $us.Number } else { $us.Index }
  $fileName = "US$n.md"
  $target = Join-Path $OutDir $fileName
  if ((Test-Path $target) -and -not $Overwrite) {
    Write-Host "Skip existing: $target" -ForegroundColor Yellow
    continue
  }
  $md = @()
  $md += "# 제목: US$n - $($us.Summary)"
  $md += ""
  $md += "## 배경"
  $md += "- 참조 PRD: `$PrdPath"
  $md += ""
  $md += "## 수용조건(AC)"
  $md += "- Given …"
  $md += "- When …"
  $md += "- Then …"
  $md += ""
  $md += "## 기술 메모"
  $md += "- API/스키마/플로우 초안"
  $md += ""
  $md += "## 테스트 관점"
  $md += "- 단위/통합/접근성/추적 이벤트"
  $md += ""
  $md += "## 메타"
  $md += "- 라벨: `feature`, `prd`"
  $md += "- 담당자: @owner"
  $md += "- 마일스톤: <YYYY-MM>"
  $mdText = ($md -join "`n")
  if ($DryRun) {
    Write-Host "[DRYRUN] Would write: $target" -ForegroundColor Cyan
    Write-Host $mdText
  } else {
    $mdText | Out-File -FilePath $target -Encoding UTF8 -Force
    Write-Host "Wrote: $target" -ForegroundColor Green
  }
}

Write-Host "완료: $($matches.Count)개 사용자 스토리 파일 생성" -ForegroundColor Green


