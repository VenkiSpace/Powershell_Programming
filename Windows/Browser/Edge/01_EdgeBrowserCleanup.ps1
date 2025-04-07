
if((Get-Process msedge -ErrorAction SilentlyContinue | Measure-Object).Count -gt 0)
{
    "Edge browser is opened. Close browser to clean."
}
else 
{
    "Edge browser is not opened."

    $Items = @(
    'Cache',
    'Cache2\entries',    
    'Network\Cookies',
    'History',
    'Top Sites',
    'Visited Links',
    'Web Data',
    'Media History',
    'Network\Cookies-Journal'
    )

    $Folder = "$($env:LOCALAPPDATA)\Microsoft\Edge\User Data\Default"

    foreach ($item in $Items) 
    {
        if (Test-Path "$Folder\$item") 
        {
            Remove-Item "$Folder\$item"  -Recurse -Force
        }
    }
}