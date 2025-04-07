
$Folders = @(
"$($env:USERPROFILE)\AppData\Local\Temp",
"$($env:USERPROFILE)\AppData\Local\Microsoft\Windows\INetCache\IE",
"$($env:USERPROFILE)\AppData\Local\Microsoft\Windows\WER",
"$($env:USERPROFILE)\AppData\Local\Microsoft\Windows\INetCookies",
"$($env:USERPROFILE)\AppData\Local\Microsoft\Windows\IECompatCache",
"$($env:USERPROFILE)\AppData\Local\Microsoft\Windows\IECompatUaCache",
"$($env:USERPROFILE)\AppData\Local\Microsoft\Windows\IEDownloadHistory",
"$($env:USERPROFILE)\AppData\Local\Microsoft\Windows\Temporary Internet Files"
#"$($env:USERPROFILE)\downloads",
#"$($env:USERPROFILE)\AppData\Local\Microsoft\Windows\Explorer"
)

foreach ($folder in $Folders) 
{
    if(Test-Path -Path $folder)
    {
        Remove-Item -Path $folder -Force -Recurse -ErrorAction SilentlyContinue

        "Folder $folder, Sub Folders and Files are deleted."
    }
}

   



