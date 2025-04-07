
#------------------------------------------------------------------#
# Delete Folder, Sub Folders and Files if exists                   #
#------------------------------------------------------------------#

Function DeleteFolder
{
    param 
    (
        $folder
    )

    "`nTask : Delete folder $folder, ant its sub folders if exist"

    if(Test-Path -Path $folder)
    {

        Remove-Item -Path $folder -Force -Recurse

        "Folder $folder and its sub folders are deleted."
    }
    else 
    {
        "Folder $folder does not exist. No Action Taken."
    }
}


#------------------------------------------------------------------#
#  Create folder if it does not exist                              #
#------------------------------------------------------------------#
Function CreateFolder
{
    param 
    (
        $folder
    )

    Write-Host("`nTask : Create folder $folder if does not exist")

    if(Test-Path -Path $folder)
    {
        "Folder $folder is already exists. No action has been taken."
    }
    else 
    {
        New-Item -Path $folder -ItemType Directory

        "Folder $folder is created."
    }
}


#------------------------------------------------------------------#
#  Create file if it does not exist                                #
#------------------------------------------------------------------#
Function CreateFile
{
    param
    (
        $folder, 
        
        $file
    )

    $file_path = $folder + "\" + $file

    "`nTask : Create file $file_path if it is not exists"

    if(Test-Path -Path ($file_path) -PathType Leaf)
    {
        "File $file_path is already exists. No Action Required"
    }
    else 
    {
        New-Item -Path $file_path -ItemType File

        "File $file_path is created successfully."
    }
}


#------------------------------------------------------------------#
#  Update content to the specified file                            #
#------------------------------------------------------------------#

Function UpdateFile
{
    param
    (
        $folder,

        $file,

        $content
    )
    
    $file_path = $folder + "\" + $file

    "`n Task : Add Content in file $file_path"

    if(Test-Path -Path $file_path -PathType Leaf)
    {
        Add-Content -Path $file_path -Value $content
    }
}
