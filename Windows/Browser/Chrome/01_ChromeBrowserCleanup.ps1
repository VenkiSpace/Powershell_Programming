# https://stackoverflow.com/questions/62711635/powershell-script-to-check-which-browsers-are-running

if((Get-Process chrome -ErrorAction SilentlyContinue | Measure-Object).Count -gt 0)
{
    "Chrome browser is opened. Close browser to clean."
}
else 
{
    "Chrome browser is not opened."
   
    $Items = @('Cache','Cache2\entries\','Cookies','History','Top Sites','VisitedLinks','Web Data','Media Cache','Cookies-Journal','ChromeDWriteFontCache')
       
    $Folder = "$($env:LOCALAPPDATA)\Google\Chrome\User Data\Default"

    foreach ($item in $Items) 
    {
        if (Test-Path "$Folder\$item") 
        {
            Remove-Item "$Folder\$item" -Recurse -Force 
        }
    }
}