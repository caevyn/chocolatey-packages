$packageName = 'videocacheview.install'
$installerType = 'exe'
$url = 'http://www.nirsoft.net/utils/videocacheview_setup.exe'
$checksum = '{checksum}'
$checksumType = 'sha1'
$silentArgs = '/S'
$validExitCodes = @(0)

Install-ChocolateyPackage -PackageName "$packageName" `
                          -FileType "$installerType" `
                          -Url "$url" `
                          -SilentArgs "$silentArgs" `
                          -ValidExitCodes $validExitCodes `
                          -Checksum "$checksum" `
                          -ChecksumType "$checksumType"