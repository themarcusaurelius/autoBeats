##[Ps1 To Exe]
##
##Kd3HDZOFADWE8uK1
##Nc3NCtDXThU=
##Kd3HFJGZHWLWoLaVvnQnhQ==
##LM/RF4eFHHGZ7/K1
##K8rLFtDXTiW5
##OsHQCZGeTiiZ4NI=
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
##L8/UAdDXTlaDjofG5iZk2UbjQ3EtZ8CXvYqDwZK36+X8hxXWXp8GWlxymiW8N0ivUOIGRskCvd8dWhooKvMfxp6eHv+sJQ==
##Kc/BRM3KXxU=
##
##
##fd6a9f26a06ea3bc99616d4851b372ba
Set-ExecutionPolicy -ExecutionPolicy Undefined -Scope CurrentUser	
Set-ExecutionPolicy -ExecutionPolicy Undefined -Scope LocalMachine
Set-ExecutionPolicy -ExecutionPolicy Undefined -Scope Process

'You are running Powershell with full privileges'

#Winlogbeat Download URL
$url = 'https://artifacts.elastic.co/downloads/beats/winlogbeat/winlogbeat-6.5.4-windows-x86_64.zip'

#Creates folder where Zip file will be temporarily stored
New-Item -ItemType Directory -Path 'c:\winlogbeat' -Force

$Dest = 'C:\winlogbeat\winlogbeat.zip'

#Downloads the Zip file to the folder
$web = New-Object -TypeName System.Net.WebClient
$web.DownloadFile($url,$Dest)

#Creates New folder where extracted files will go
# New-Item -ItemType Directory -Path 'c:\beats' -Force

#Defines where the extracted folder where go
$ExtractDir = 'c:\'

#Extracts the zip folder and sends to the new folder
$ExtShell = New-Object -ComObject Shell.Application
$files = $ExtShell.Namespace($Dest).Items()
$ExtShell.Namespace($ExtractDir).CopyHere($files)

#Removes original filbeat folder
Remove-Item -LiteralPath 'c:\winlogbeat' -Recurse -Confirm:$false

#Renames winlogbeat-6.5.4-windows-x86_64 to winlogbeat
Rename-Item 'C:\winlogbeat-6.5.4-windows-x86_64' 'C:\winlogbeat'

#CD's into Folder
Set-Location -Path 'c:\winlogbeat'

#Sets the Execution Policy to allow the installation as a service
Set-ExecutionPolicy Unrestricted

'Execution policy set - Success'

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
(Get-Content winlogbeat.yml) |
    ForEach-Object {$_ -Replace 'localhost:9200', $objTextBox4.Text} |
        Set-Content winlogbeat.yml

#Opens up YML file and inserts Kibana Host URL       
(Get-Content winlogbeat.yml) |       
    ForEach-Object {$_ -Replace '#host: "localhost:5601"', "host: ""$($objTextBox.Text)"""} |
        Set-Content winlogbeat.yml

#Opens Up YML and sets Username
$lineNumber = 72
$fileContent = Get-Content winlogbeat.yml
$fileContent[$lineNumber-1] += "  username: ""$($objTextBox2.Text)"""
$fileContent | Set-Content winlogbeat.yml

#Opens Up YML and sets Password
(Get-Content winlogbeat.yml) |       
    ForEach-Object {$_ -Replace "# Kibana Space ID", "password: ""$($objTextBox3.Text)""" } |
        Set-Content winlogbeat.yml

#Runs the config test to make sure all data has been inputted correctly
.\winlogbeat.exe -e -configtest

#Loads winlogbeat Preconfigured Dashboards
.\winlogbeat.exe setup --dashboards

#Installs winlogbeat as a service
.\install-service-winlogbeat.ps1

#Runs winlogbeat as a Service
Start-service winlogbeat

#Shows that winlogbeat is running
Get-Service winlogbeat

#Opens Kibana after winlogbeat has successfully installed and is running
Start-Process -FilePath """$($objTextBox.Text)"""

#Closes Powershell window upon completion of tasks
Stop-Process -Id $PID
