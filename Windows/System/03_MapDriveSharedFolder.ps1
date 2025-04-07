$drive = "G"
$sharedFolder = "\\PC-101\MiniTool"

New-PSDrive -Name $drive -PSProvider “FileSystem” -Root $sharedFolder -Persist