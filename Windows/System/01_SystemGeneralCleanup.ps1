
$Folders = @(
"C:\WINDOWS\Offline Web Pages",
"C:\Windows\Temp",
"C:\Windows\Prefetch",
"C:\`$Recycle.Bin"
)

foreach ($folder in $Folders) 
{
    if(Test-Path -Path $folder)
    {
        Remove-Item -Path $folder -Force -Recurse -ErrorAction SilentlyContinue

        "Folder $folder, Sub Folders and Files are deleted."
    }
}

   



