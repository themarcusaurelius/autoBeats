##[Ps1 To Exe]
##
##Kd3HDZOFADWE8uK1
##Nc3NCtDXThU=
##Kd3HFJGZHWLWoLaVvnQnhQ==
##LM/RF4eFHHGZ7/K1
##K8rLFtDXTiW5
##OsHQCZGeTiiZ4tI=
##OcrLFtDXTiW5
##LM/BD5WYTiiZ4tI=
##McvWDJ+OTiiZ4tI=
##OMvOC56PFnzN8u+Vs1Q=
##M9jHFoeYB2Hc8u+Vs1Q=
##PdrWFpmIG2HcofKIo2QX
##OMfRFJyLFzWE8uK1
##KsfMAp/KUzWJ0g==
##OsfOAYaPHGbQvbyVvnQX
##LNzNAIWJGmPcoKHc7Do3uAuO
##LNzNAIWJGnvYv7eVvnQX
##M9zLA5mED3nfu77Q7TV64AuzAgg=
##NcDWAYKED3nfu77Q7TV64AuzAgg=
##OMvRB4KDHmHQvbyVvnQX
##P8HPFJGEFzWE8tI=
##KNzDAJWHD2fS8u+Vgw==
##P8HSHYKDCX3N8u+Vgw==
##LNzLEpGeC3fMu77Ro2k3hQ==
##L97HB5mLAnfMu77Ro2k3hQ==
##P8HPCZWEGmaZ7/K1
##L8/UAdDXTlaDjofG5iZk2UbjQ3EtZ8CXvYqDwZK36+X8hxHRTNo2TFVjhRX9FEq+UfAXVOEptcEQVhUvLfcK9pb8Vfe6FOwPiuYf
##Kc/BRM3KXxU=
##
##
##fd6a9f26a06ea3bc99616d4851b372ba

Set-ExecutionPolicy -ExecutionPolicy Undefined -Scope CurrentUser	
Set-ExecutionPolicy -ExecutionPolicy Undefined -Scope LocalMachine
Set-ExecutionPolicy -ExecutionPolicy Undefined -Scope Process

$principal = New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())

if($principal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    "`n Welcome to the auto setup of Apachebeat. I hope you enjoy - Mark"

    #Filebeat Download URL
    $url = 'https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-6.5.4-windows-x86_64.zip'

    #Creates folder where Zip file will be temporarily stored
    New-Item -ItemType Directory -Path 'c:\apachebeat' -Force

    #Sets Destination where the zip file will download
    $Dest = 'C:\apachebeat\filebeat.zip'

    #Downloads the Zip file to the folder
    $web = New-Object -TypeName System.Net.WebClient
    $web.DownloadFile($url,$Dest)

    #Defines where the extracted folder where go
    $ExtractDir = 'c:\'

    #Extracts the zip folder and sends to the new folder
    $ExtShell = New-Object -ComObject Shell.Application
    $files = $ExtShell.Namespace($Dest).Items()
    $ExtShell.Namespace($ExtractDir).CopyHere($files)

    #Removes original filbeat folder
    Remove-Item -LiteralPath 'c:\apachebeat' -Recurse -Confirm:$false

    #Renames filebeat-6.5.4-windows-x86_64 to filebeat
    Rename-Item 'C:\filebeat-6.5.4-windows-x86_64' 'C:\apachebeat'

    #CD's into Folder
    Set-Location -Path 'c:\apachebeat'

    #Sets the Execution Policy to allow the installation as a service
    Set-ExecutionPolicy Unrestricted

    "`n Execution policy set - Success`n"

    #Enable the Apache 2 module
    .\filebeat.exe modules enable apache2

    #Pop-up Box that Adds Credentials 
    [void] [System.Reflection.Assembly]::LoadWithPartialName("System.Drawing") 
    [void] [System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms") 

    #============ Box ============#
    $objForm = New-Object System.Windows.Forms.Form 
    $objForm.Text = "Vizion.ai Credentials Form"
    $objForm.Size = New-Object System.Drawing.Size(300,400) 
    $objForm.StartPosition = "CenterScreen"

    $objForm.KeyPreview = $True
    $objForm.Add_KeyDown({
        if ($_.KeyCode -eq "Enter" -or $_.KeyCode -eq "Escape"){
            $objForm.Close()
        }
    })

    #============= Buttons =========#
    $OKButton = New-Object System.Windows.Forms.Button
    $OKButton.Location = New-Object System.Drawing.Size(75,280)
    $OKButton.Size = New-Object System.Drawing.Size(75,23)
    $OKButton.Text = "OK"
    $OKButton.Add_Click({$objForm.Close()})
    $objForm.Controls.Add($OKButton)

    $CancelButton = New-Object System.Windows.Forms.Button
    $CancelButton.Location = New-Object System.Drawing.Size(150,280)
    $CancelButton.Size = New-Object System.Drawing.Size(75,23)
    $CancelButton.Text = "Cancel"
    $CancelButton.Add_Click({$objForm.Close()})
    $objForm.Controls.Add($CancelButton)

    #============= Header ==========#
    $objLabel = New-Object System.Windows.Forms.Label
    $objLabel.Location = New-Object System.Drawing.Size(10,10) 
    $objLabel.Size = New-Object System.Drawing.Size(280,20) 
    $objLabel.Text = "Please enter the following:"
    $objForm.Controls.Add($objLabel)

    #============ First Input =======#
    $objLabel1 = New-Object System.Windows.Forms.Label
    $objLabel1.Location = New-Object System.Drawing.Size(10,40) 
    $objLabel1.Size = New-Object System.Drawing.Size(280,20) 
    $objLabel1.Text = "Kibana URL"
    $objForm.Controls.Add($objLabel1)

    $objTextBox = New-Object System.Windows.Forms.TextBox 
    $objTextBox.Location = New-Object System.Drawing.Size(10,60) 
    $objTextBox.Size = New-Object System.Drawing.Size(260,20) 
    $objForm.Controls.Add($objTextBox) 

    #============ Second Input =======#
    $objLabel2 = New-Object System.Windows.Forms.Label
    $objLabel2.Location = New-Object System.Drawing.Size(10,100) 
    $objLabel2.Size = New-Object System.Drawing.Size(280,20) 
    $objLabel2.Text = "Username:"
    $objForm.Controls.Add($objLabel2)

    $objTextBox2 = New-Object System.Windows.Forms.TextBox 
    $objTextBox2.Location = New-Object System.Drawing.Size(10,120) 
    $objTextBox2.Size = New-Object System.Drawing.Size(260,20) 
    $objForm.Controls.Add($objTextBox2)

    # #============ Third Input =======#
    $objLabel3 = New-Object System.Windows.Forms.Label
    $objLabel3.Location = New-Object System.Drawing.Size(10,160) 
    $objLabel3.Size = New-Object System.Drawing.Size(280,20) 
    $objLabel3.Text = "Password:"
    $objForm.Controls.Add($objLabel3)

    $objTextBox3 = New-Object System.Windows.Forms.TextBox 
    $objTextBox3.Location = New-Object System.Drawing.Size(10,180) 
    $objTextBox3.Size = New-Object System.Drawing.Size(260,20) 
    $objForm.Controls.Add($objTextBox3)

    #============ Fourth Input =======#
    $objLabel4 = New-Object System.Windows.Forms.Label
    $objLabel4.Location = New-Object System.Drawing.Size(10,220) 
    $objLabel4.Size = New-Object System.Drawing.Size(280,20) 
    $objLabel4.Text = "Vizion Elasticsearch API Endpoint:"
    $objForm.Controls.Add($objLabel4)

    $objTextBox4 = New-Object System.Windows.Forms.TextBox 
    $objTextBox4.Location = New-Object System.Drawing.Size(10,240) 
    $objTextBox4.Size = New-Object System.Drawing.Size(260,20) 
    $objForm.Controls.Add($objTextBox4)

    $objForm.Topmost = $True

    $objForm.Add_Shown({$objForm.Activate()})
    [void]$objForm.ShowDialog()


    #Opens up YML file and inserts Elasticsearch API Endpoint
    (Get-Content filebeat.yml) |
        ForEach-Object {$_ -Replace 'localhost:9200', $objTextBox4.Text} |
            Set-Content filebeat.yml

    #Opens up YML file and inserts Kibana Host URL       
    (Get-Content filebeat.yml) |       
        ForEach-Object {$_ -Replace '#host: "localhost:5601"', "host: ""$($objTextBox.Text)"""} |
            Set-Content filebeat.yml

    #Opens Up YML and sets Username
    $lineNumber = 124
    $fileContent = Get-Content filebeat.yml
    $fileContent[$lineNumber-1] += "  username: ""$($objTextBox2.Text)"""
    $fileContent | Set-Content filebeat.yml

    #Opens Up YML and sets Password
    (Get-Content filebeat.yml) |       
        ForEach-Object {$_ -Replace "# Kibana Space ID", "password: ""$($objTextBox3.Text)""" } |
            Set-Content filebeat.yml

    # #Opens up and Sets Index to - index: "apachebeat-%{+yyyy.MM.dd}"
    # $lineNumber = 151
    # $fileContent = Get-Content filebeat.yml
    # $fileContent[$lineNumber-1] += "  index: ""apachebeat-%{+yyyy.MM.dd}"""
    # $fileContent | Set-Content filebeat.yml

    # #Sets the template name
    # $lineNumber = 156
    # $fileContent = Get-Content filebeat.yml
    # $fileContent[$lineNumber-1] += "setup.template.name: ""apachebeat""`nsetup.template.pattern: ""apachebeat-*""`nsetup.template.overwrite: true"
    # $fileContent | Set-Content filebeat.yml

    
    #Sets location to modules.d folder
    Set-Location -Path 'C:\apachebeat\modules.d\'

    #Opens up apache2.yml and enables paths
    (Get-Content apache2.yml) |       
        ForEach-Object {$_ -Replace "#var.paths:", "var.paths:"} |
        Set-Content apache2.yml

    #Set file path for access logs
    function Read-FolderBrowserDialog([string]$Message, [string]$InitialDirectory, [switch]$NoNewFolderButton) {
        $browseForFolderOptions = 0
        if ($NoNewFolderButton) { $browseForFolderOptions += 512 }
    
        $app = New-Object -ComObject Shell.Application
        $folder = $app.BrowseForFolder(0, $Message, $browseForFolderOptions, $InitialDirectory)
        if ($folder) { $selectedDirectory = $folder.Self.Path } else { $selectedDirectory = '' }
        [System.Runtime.Interopservices.Marshal]::ReleaseComObject($app) > $null
        return $selectedDirectory
    }
    
    $directoryPath = Read-FolderBrowserDialog -Message "Select the folder to the Apache2 Access Logs" -InitialDirectory 'C:\' -NoNewFolderButton
    
    #Conditional that doesn't let 
    if (![string]::IsNullOrEmpty($directoryPath)) { 
        Write-Host "`n For Access logs you selected the folder: $directoryPath"

        # Opens Up YML and sets path to Access logs that were declared by user
        $lineNumber = 9
        $fileContent = Get-Content apache2.yml
        $fileContent[$lineNumber-1] += "     - $($directoryPath)\*"
        $fileContent | Set-Content apache2.yml   
    }
    else { 
        "`n You did not select a directory." 
    }

    #Error Logs
    function Read-FolderBrowserDialog([string]$Message, [string]$InitialDirectory, [switch]$NoNewFolderButton) {
        $browseForFolderOptions = 0
        if ($NoNewFolderButton) { $browseForFolderOptions += 512 }
    
        $app = New-Object -ComObject Shell.Application
        $folder = $app.BrowseForFolder(0, $Message, $browseForFolderOptions, $InitialDirectory)
        if ($folder) { $selectedDirectory = $folder.Self.Path } else { $selectedDirectory = '' }
        [System.Runtime.Interopservices.Marshal]::ReleaseComObject($app) > $null
        return $selectedDirectory
    }
    
    $directoryPath2 = Read-FolderBrowserDialog -Message "Select the folder to the Apache2 Error Logs" -InitialDirectory 'C:\' -NoNewFolderButton
    
    #Conditional that doesn't let 
    if (![string]::IsNullOrEmpty($directoryPath2)) { 
        Write-Host "`n For error logs you selected the folder: $directoryPath2`n"

        # Opens Up YML and sets path to Access logs that were declared by user
        $lineNumber = 16
        $fileContent = Get-Content apache2.yml
        $fileContent[$lineNumber-1] += "`n     - $($directoryPath2)\*"
        $fileContent | Set-Content apache2.yml
        
    }
    else { 
        "`n You did not select a directory." 
    }


    # #Change filebeat.json
    # Set-Location -Path 'C:\apachebeat\kibana\5\index-pattern\'
    # (Get-Content filebeat.json) |       
    #     ForEach-Object {$_ -Replace "filebeat-", "apachebeat-"} |
    #     Set-Content filebeat.json

    # #Change filebeat.json
    # Set-Location -Path 'C:\apachebeat\kibana\6\index-pattern\'
    # (Get-Content filebeat.json) |       
    #     ForEach-Object {$_ -Replace "filebeat-", "apachebeat-"} |
    #     Set-Content filebeat.json

    # #Change access-logs.json
    # Set-Location -Path 'C:\apachebeat\kibana\5\search\'
    # (Get-Content Apache2-access-logs.json) |       
    #     ForEach-Object {$_ -Replace "filebeat-", "apachebeat-"} |
    #     Set-Content Apache2-access-logs.json

    # #Change access-logs.json
    # Set-Location -Path 'C:\apachebeat\kibana\5\search\'
    # (Get-Content Apache2-errors-log.json) |       
    #     ForEach-Object {$_ -Replace "filebeat-", "apachebeat-"} |
    #     Set-Content Apache2-errors-log.json

    # #Change access-logs.json
    # Set-Location -Path 'C:\apachebeat\kibana\5\search\'
    # (Get-Content Apache2-error-log.json) |       
    #     ForEach-Object {$_ -Replace "filebeat-", "apachebeat-"} |
    #     Set-Content Apache2-error-log.json

    #Sets location back to main directory
    Set-Location -Path 'C:\apachebeat\'
    
    # #Changes search options to apachebeat-*.
    # $items = Get-ChildItem * -recurse

    # foreach ($item in $items)
    # {
    #     # if the item is a directory, then process it.
    #     if ($item.Attributes -ne "Directory")
    #     {
    #         (Get-Content $item.FullName ) |
    #         Foreach-Object { $_ -replace 'filebeat-*', 'apachebeat-*' } |
    #         Set-Content $item.FullName
    #     }
    # }

    #Runs the config test to make sure all data has been inputted correctly
    .\filebeat.exe -e -configtest

    #Load Filebeat Preconfigured Dashboards
    .\filebeat.exe setup --dashboards

    #For running in the console if you would like to visually see the logs incoming
    #.\filebeat.exe -c filebeat.yml -e -d "*"

    #Install filebeat as a service
    .\install-service-filebeat.ps1

    #Runs filebeat as a Service
    Start-service filebeat

    #Show that filebeat is running
    Get-Service filebeat

    #Open Kibana after Filebeat has successfully installed and is running
    Start-Process -FilePath """$($objTextBox.Text)"""

    #Close Powershell window
    Stop-Process -Id $PID

    #PowerShell -NoExit "C:\Users\mmayfield\Desktop\The Beats\testing"

}
    else {
        Start-Process -FilePath "powershell" -ArgumentList "$('-File ""')$(Get-Location)$('\')$($MyInvocation.MyCommand.Name)$('""')" -Verb runAs
}