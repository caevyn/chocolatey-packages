$packageName = 'foldit'
$packageSearch = "$packageName"
$fileType = 'exe'
$silentArgs = '/S'
$validExitCodes = @(0)
try {
  Get-ItemProperty -Path @( 'HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*',
                            'HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*',
                            'HKCU:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*' ) `
                   -ErrorAction:SilentlyContinue `
  | Where-Object   { $_.DisplayName -like "$packageSearch" } `
  | ForEach-Object { Uninstall-ChocolateyPackage -PackageName "$packageName" `
                                                 -FileType "$fileType" `
                                                 -SilentArgs "$($silentArgs)" `
                                                 -File "$($_.UninstallString)" `
                                                 -ValidExitCodes $validExitCodes }
} catch {
  throw $_.Exception
}