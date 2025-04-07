
Import-Module ./FilesAndFolders/01_DeleteFolder.ps1

Import-Module ./FilesAndFolders/02_CreateFolder.ps1

Import-Module ./FilesAndFolders/03_CreateFile.ps1

Import-Module ./FilesAndFolders/04_UpdateFile.ps1

DeleteFolder -src_folder ".\FilesAndFolders\data"

CreateFolder -src_folder ".\FilesAndFolders\data\src"

CreateFile -src_folder ".\FilesAndFolders\data\src" -src_file "sample.txt"

UpdateFile -src_folder ".\FilesAndFolders\data\src" -src_file "sample.txt"

CopyFile -src_folder ".\FilesAndFolders\data\src" -src_file "sample.txt" -dst_folder ".\FilesAndFolders\data\dst"

###
#   Task : Copy a file from source directory to destination directory
###

function CopyFile
{
    param
    (
        $src_folder,
        $src_file,
        $dst_folder
    )

    Write-Information "`n Task : Copy file $src_file from  $src_folder to $dst_folder"

    $src_file_path = $src_folder + "\" + $src_file

    if(Test-Path -Path $src_file_path -PathType Leaf)
    {
        if(Test-Path -Path $dst_folder)
        {
            Write-Information "`n Folder $dst_folder is already exists. No Action Required"
        }
        else 
        {
            Write-Information "`n Folder $dst_folder does not exist. Folder will be created"

            New-Item -Path $dst_folder -ItemType Directory
        }

        Copy-Item -Path $src_file_path -Destination $dst_folder -Force

        Write-Debug " `n File $src_file is copied from source folder $src_folder to destination folder $dst_folder successfully!!!"
    }
    else 
    {
        Write-Debug "`n File copy is failed as $src_file doest not exist in folder $src_folder"
    }

    "computer name::: $env:computername"
}
