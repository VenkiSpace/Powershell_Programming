
if((Get-Process firefox -ErrorAction SilentlyContinue | Measure-Object).Count -gt 0)
{
    "Firefox browser is opened. Close browser to clean."
}
else 
{
    "Firefox browser is not opened."

    $Items = @('cache','cache2\entries','thumbnails','cookies.sqlite','webappsstore.sqlite','chromeappstore.sqlite')
        
    $fireFoxLocation = "$($env:LOCALAPPDATA)\Mozilla\Firefox\Profiles"
    
    $userData = (Get-ChildItem $fireFoxLocation | Where-Object { $_.Name -match 'Default' }[0]).FullName 
        
    ForEach ($item in $Items) 
    {
        if (Test-Path "$userData\$item") 
        {
            "$userData\$item"
            Remove-Item "$userData\$item"  -Recurse -Force -ErrorAction SilentlyContinue -Verbose   
        }
    }
}