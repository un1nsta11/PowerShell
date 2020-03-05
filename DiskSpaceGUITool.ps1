﻿#========================================================================
# Generated On: 01/31/2014
# Generated By: Prashanth Jayaram
# Version     : 1.1
# Change Desc : Tab Index fix and column names are changed, Form Size correction , Accept default machine name
#========================================================================

function OnApplicationLoad {
 
 if([Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms.DataVisualization") -eq $null)
 {
  #Microsoft Chart Controls are not installed
  [void][reflection.assembly]::Load("System.Windows.Forms, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089")
  [void][System.Windows.Forms.MessageBox]::Show("Microsoft Chart Controls for Microsoft .NET 3.5 Framework is required","Microsoft Chart Controls Required")
  #Open the URL
  [System.Diagnostics.Process]::Start("http://www.microsoft.com/downloads/en/details.aspx?familyid=130F7986-BF49-4FE5-9CA8-910AE6EA442C&displaylang=en");
  return $false
 }
 
 return $true #return true for success or false for failure
}

function OnApplicationExit {
 #Note: This function is not called in Projects
 #Note: This function runs after the form is closed
 #TODO: Add custom code to clean up and unload snapins when the application exits
 
 $script:ExitCode = 0 #Set the exit code for the Packager
}

#endregion Application Functions

#----------------------------------------------
# Generated Form Function
#----------------------------------------------
function Call-SystemInformation_pff {

 #----------------------------------------------
 #region Import the Assemblies
 #----------------------------------------------
 [void][reflection.assembly]::Load("System, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089")
 [void][reflection.assembly]::Load("System.Windows.Forms, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089")
 [void][reflection.assembly]::Load("System.Data, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089")
 [void][reflection.assembly]::Load("System.Drawing, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a")
 [void][reflection.assembly]::Load("mscorlib, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089")
 [void][reflection.assembly]::Load("System.Windows.Forms.DataVisualization, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35")
 #endregion Import Assemblies

 #----------------------------------------------
 #region Generated Form Objects
 #----------------------------------------------
    [System.Windows.Forms.Application]::EnableVisualStyles()
    $formDiskSpacePieChart = New-Object System.Windows.Forms.Form
    $dataGrid1 = New-Object System.Windows.Forms.DataGrid 
    $chart1 = New-Object System.Windows.Forms.DataVisualization.Charting.Chart
    $InitialFormWindowState = New-Object System.Windows.Forms.FormWindowState
    $btnRefresh = New-Object System.Windows.Forms.Button
    $btngetdata=New-Object System.Windows.Forms.Button
	$rtbPerfData = New-Object System.Windows.Forms.RichTextBox
	$lblServicePack = New-Object System.Windows.Forms.Label
    $lblDBName= New-Object System.Windows.Forms.Label
	$lblOS = New-Object System.Windows.Forms.Label
	$statusBar1 = New-Object System.Windows.Forms.StatusBar
	$btnClose = New-Object System.Windows.Forms.Button
	$InitialFormWindowState = New-Object System.Windows.Forms.FormWindowState
    $txtComputerName = New-Object System.Windows.Forms.TextBox
    $dataGrid1 = New-Object System.Windows.Forms.DataGrid 

 
 function Load-Chart
 {
  Param( #$XPoints, $YPoints, $XTitle, $YTitle, $Title, $ChartStyle)
   [Parameter(Position=1,Mandatory=$true)]
     [System.Windows.Forms.DataVisualization.Charting.Chart]$ChartControl
   ,
   [Parameter(Position=2,Mandatory=$true)]
     $XPoints
   ,
   [Parameter(Position=3,Mandatory=$true)]
     $YPoints
   ,
   [Parameter(Position=4,Mandatory=$false)]
     [string]$XTitle
   ,
   [Parameter(Position=5,Mandatory=$false)]
     [string]$YTitle
   ,
   [Parameter(Position=6,Mandatory=$false)]
     [string]$Title
   ,
   [Parameter(Position=7,Mandatory=$false)]
     [System.Windows.Forms.DataVisualization.Charting.SeriesChartType]$ChartType
   ,
   [Parameter(Position=8,Mandatory=$false)]
     $SeriesIndex = 0
   ,
   [Parameter(Position=9,Mandatory=$false)]
     $TitleIndex = 0,
   [switch]$Append)
 
  $ChartAreaIndex = 0
  if($Append)
  {
   $name = "ChartArea " + ($ChartControl.ChartAreas.Count + 1).ToString();
   $ChartArea = $ChartControl.ChartAreas.Add($name)
   $ChartAreaIndex = $ChartControl.ChartAreas.Count - 1
   
   $name = "Series " + ($ChartControl.Series.Count + 1).ToString();
   $Series = $ChartControl.Series.Add($name) 
   $SeriesIndex = $ChartControl.Series.Count - 1
 
   $Series.ChartArea = $ChartArea.Name
   
   if($Title)
   {
    $name = "Title " + ($ChartControl.Titles.Count + 1).ToString();
    $TitleObj = $ChartControl.Titles.Add($name)
    $TitleIndex = $ChartControl.Titles.Count - 1 
    $TitleObj.DockedToChartArea = $ChartArea.Name
    $TitleObj.IsDockedInsideChartArea = $false
   }
  }
  else
  {
   if($ChartControl.ChartAreas.Count -eq  0)
   {
    $name = "ChartArea " + ($ChartControl.ChartAreas.Count + 1).ToString();
    [void]$ChartControl.ChartAreas.Add($name)
    $ChartAreaIndex = $ChartControl.ChartAreas.Count - 1
   } 
   
   if($ChartControl.Series.Count -eq 0)
   {
    $name = "Series " + ($ChartControl.Series.Count + 1).ToString();
    $Series = $ChartControl.Series.Add($name) 
    $SeriesIndex = $ChartControl.Series.Count - 1
    $Series.ChartArea = $ChartControl.ChartAreas[0].Name
   }
  }
  
  $Series = $ChartControl.Series[$SeriesIndex]
  $ChartArea = $ChartControl.ChartAreas[$Series.ChartArea]
  
  $Series.Points.Clear()
  
  if($Title)
  {
   if($ChartControl.Titles.Count -eq 0)
   {
    $name = "Title " + ($ChartControl.Titles.Count + 1).ToString();
    [void]$ChartControl.Titles.Add($name)
    $TitleIndex = $ChartControl.Titles.Count - 1
    $TitleObj.DockedToChartArea = $ChartArea.Name
    $TitleObj.IsDockedInsideChartArea = $false
   }
   
   $ChartControl.Titles[$TitleIndex].Text = $Title
  }
  
  if($ChartType)
  {
   $Series.ChartType = $ChartType
  }
  
  if($XTitle)
  {
   $ChartArea.AxisX.Title = $XTitle
  }
  
  if($YTitle)
  {
   $ChartArea.AxisY.Title = $YTitle
  }
  
  if($XPoints -isnot [Array] -or $XPoints -isnot [System.Collections.IEnumerable])
  {
   $array = New-Object System.Collections.ArrayList
   $array.Add($XPoints)
   $XPoints = $array
  }
  
  if($YPoints -isnot [Array] -or $YPoints -isnot [System.Collections.IEnumerable])
  {
   $array = New-Object System.Collections.ArrayList
   $array.Add($YPoints)
   $YPoints = $array
  }
  
  $Series.Points.DataBindXY($XPoints, $YPoints)
 
 }
 
 function Clear-Chart
 {
  Param (  
  [Parameter(Position=1,Mandatory=$true)]
    [System.Windows.Forms.DataVisualization.Charting.Chart]$ChartControl
  ,
  [Parameter(Position=2, Mandatory=$false)]
  [Switch]$LeaveSingleChart
  )
  
  $count = 0 
  if($LeaveSingleChart)
  {
   $count = 1
  }
  
  while($ChartControl.Series.Count -gt $count)
  {
   $ChartControl.Series.RemoveAt($ChartControl.Series.Count - 1)
  }
  
  while($ChartControl.ChartAreas.Count -gt $count)
  {
   $ChartControl.ChartAreas.RemoveAt($ChartControl.ChartAreas.Count - 1)
  }
  
  while($ChartControl.Titles.Count -gt $count)
  {
   $ChartControl.Titles.RemoveAt($ChartControl.Titles.Count - 1)
  }
  
  if($ChartControl.Series.Count -gt 0)
  {
   $ChartControl.Series[0].Points.Clear()
  }
 }
 #endregion

<#
 $FormEvent_Load={
  #TODO: Initialize Form Controls here
  Load-PieChart 
 }
 #>
 
 function Load-PieChart
 {
param(
[string[]]$servers = "$ENV:COMPUTERNAME"
)
  foreach ($server in $servers) {
  #Get Disk space using WMI and make sure it is an array
  $Disks = @(Get-WMIObject -Namespace "root\cimv2" -class Win32_LogicalDisk -Impersonation 3 -ComputerName $server -filter "DriveType=3" )
   
  #Remove all the current charts
  Clear-Chart $chart1
  
  #Loop through each drive
  foreach($disk in $Disks)
  { 
   $UsedSpace =(($disk.size - $disk.freespace)/1gb)
   $FreeSpace = ($disk.freespace/1gb)
 
   #Load a Chart for each Drive
   Load-Chart $chart1 -XPoints ("Used ({0:N1} GB)" -f $UsedSpace), ("Free Space ({0:N1} GB)" -f $FreeSpace) -YPoints $UsedSpace, $FreeSpace -ChartType "Bar" -Title ("Volume: {0} ({1:N1} GB)" -f $disk.deviceID, ($disk.size/1gb) ) -Append 
  }
  
  #Set Custom Style
  foreach ($Series in $chart1.Series)
  {
   $Series.CustomProperties = "PieDrawingStyle=Concave"
  }
 }
 }


function Get-DiskDetails
{
param(
[string[]]$ComputerName = $env:COMPUTERNAME
)
$Object =@()
$array = New-Object System.Collections.ArrayList      
foreach ($Computer in $ComputerName) {
if(Test-Connection -ComputerName $Computer -Count 1 -ea 0) {
Write-Verbose "$Computer online"
$D=Get-WmiObject win32_logicalDisk -ComputerName $Computer  |where {$_.DriveType -eq 3}|select-object DeviceID, VolumeName,FreeSpace,Size 
foreach($disk in $D)
{
$TotalSize = $Disk.Size /1Gb -as [int]
$InUseSize = ($Disk.Size /1Gb -as [int]) – ($Disk.Freespace / 1Gb -as [int])
$FreeSpaceGB = $Disk.Freespace / 1Gb -as [int]
$FreeSpacePer = ((($Disk.Freespace /1Gb -as [float]) / ($Disk.Size / 1Gb -as [float]))*100) -as [int]

$Object += New-Object PSObject -Property @{
Name= $Computer;
Drive= $Disk.DeviceID;
Label=$Disk.VolumeName;
SizeGB=$TotalSize;
UseGB=$InUseSize;
FreeGB=$FreeSpaceGB;
'% Free' =$FreeSpacePer;
}
}
}
}


$array.AddRange($Object) 
$dataGrid1.DataSource = $array 

}

 $GetData={
	    if ($txtComputerName.text -eq '')
        {
        $txtComputerName.text =$env:COMPUTERNAME
        }
        $statusBar1.text="Getting Disk Space Details Data..please wait"
        if(Test-Connection -ComputerName $txtComputerName.text -Count 1 -ea 0) { 
        $data=Get-DiskDetails -ComputerName $txtComputerName.text | Out-String
        Load-PieChart -servers $txtComputerName.text 
        }
        else
        {
        [Windows.Forms.MessageBox]::Show(“Not able connect to the server", [Windows.Forms.MessageBoxIcon]::Information)
        }
        #$rtbPerfData.text=$data.Trim()
        $errorActionPreference="Continue"
	    $statusBar1.Text="Ready"
        
	
	}
	
  
	$Close={
	    $formDiskSpacePieChart.close()
	
	}
 # --End User Generated Script--
 #----------------------------------------------
 # Generated Events
 #----------------------------------------------
 
 $Form_StateCorrection_Load=
 {
  #Correct the initial state of the form to prevent the .Net maximized form issue
  $formDiskSpacePieChart.WindowState = $InitialFormWindowState
 }

 #----------------------------------------------
 #region Generated Form Code
 #----------------------------------------------
 #
 # formDiskSpacePieChart
 #
 $formDiskSpacePieChart.Controls.Add($buttonSave)
 $formDiskSpacePieChart.Controls.Add($chart1)
 $formDiskSpacePieChart.ClientSize = New-Object System.Drawing.Size(513,540)
 $formDiskSpacePieChart.DataBindings.DefaultDataSourceUpdateMode = [System.Windows.Forms.DataSourceUpdateMode]::OnValidation 
 $formDiskSpacePieChart.MinimumSize = New-Object System.Drawing.Size(300,300)
 $formDiskSpacePieChart.Name = "formDiskSpacePieChart"
 $formDiskSpacePieChart.Text = "Disk Space Pie Chart"
 $formDiskSpacePieChart.Controls.Add($btnRefresh)
 $formDiskSpacePieChart.Controls.Add($lblServicePack)
 $formDiskSpacePieChart.Controls.Add($lblOS)
 $formDiskSpacePieChart.Controls.Add($lblDBName)
 $formDiskSpacePieChart.Controls.Add($statusBar1)
 $formDiskSpacePieChart.Controls.Add($btnClose)
 $formDiskSpacePieChart.Controls.Add($txtComputerName)
 $formDiskSpacePieChart.ClientSize = New-Object System.Drawing.Size(630,600)
 $formDiskSpacePieChart.DataBindings.DefaultDataSourceUpdateMode = [System.Windows.Forms.DataSourceUpdateMode]::OnValidation 
 $formDiskSpacePieChart.Name = "form1"
 $formDiskSpacePieChart.Text = "Disk Space Usage Information"
 $formDiskSpacePieChart.add_Load($PopulateList)
 $formDiskSpacePieChart.add_Load($FormEvent_Load)

 
$System_Drawing_Size = New-Object System.Drawing.Size 
$System_Drawing_Size.Width = 600 
$System_Drawing_Size.Height = 125
$dataGrid1.Size = $System_Drawing_Size 
$dataGrid1.DataBindings.DefaultDataSourceUpdateMode = 0 
$dataGrid1.HeaderForeColor = [System.Drawing.Color]::FromArgb(255,0,0,0) 
$dataGrid1.Name = "dataGrid1" 
$dataGrid1.DataMember = "" 
$dataGrid1.TabIndex = 0 
$System_Drawing_Point = New-Object System.Drawing.Point 
$System_Drawing_Point.X =13 
$System_Drawing_Point.Y = 62
$dataGrid1.Location = $System_Drawing_Point 
 
$formDiskSpacePieChart.Controls.Add($dataGrid1) 
$dataGrid1.CaptionText='Disk Details'

	#
	# btnRefresh
	#
	$btnRefresh.DataBindings.DefaultDataSourceUpdateMode = [System.Windows.Forms.DataSourceUpdateMode]::OnValidation 
	$btnRefresh.Enabled = $TRUE
	$btnRefresh.Location = New-Object System.Drawing.Point(230,35)
	$btnRefresh.Name = "btnRefresh"
	$btnRefresh.Size = New-Object System.Drawing.Size(95,20)
	$btnRefresh.TabIndex = 2
	$btnRefresh.Text = "GetDiskSpace"
	$btnRefresh.UseVisualStyleBackColor = $True
	$btnRefresh.add_Click($GetData)
    #
    #
 
    # btnClose
	#
    
	$btnClose.DataBindings.DefaultDataSourceUpdateMode = [System.Windows.Forms.DataSourceUpdateMode]::OnValidation 
	$btngetdata.Enabled = $TRUE
    $btnClose.Location = New-Object System.Drawing.Point(373,35)
	$btnClose.Name = "btnClose"
	$btnClose.Size = New-Object System.Drawing.Size(95,20)
	$btnClose.TabIndex = 3
	$btnClose.Text = "Close"
	$btnClose.UseVisualStyleBackColor = $True
	$btnClose.add_Click($Close)
	#
    
    # lblDBName
	#
	$lblDBName.DataBindings.DefaultDataSourceUpdateMode = [System.Windows.Forms.DataSourceUpdateMode]::OnValidation 
	$lblDBName.Font = New-Object System.Drawing.Font("Lucida Console",8.25,1,3,1)
	$lblDBName.Location = New-Object System.Drawing.Point(13,10)
	$lblDBName.Name = "lblDBName"
	$lblDBName.Size = New-Object System.Drawing.Size(178,23)
	$lblDBName.TabIndex = 0
	$lblDBName.Text = "Enter Server Name "
	$lblDBName.Visible = $TRUE
    #
    
	#$txtComputerName.text
    #txtComputerName
    $txtComputerName.DataBindings.DefaultDataSourceUpdateMode = [System.Windows.Forms.DataSourceUpdateMode]::OnValidation 
    $txtComputerName.Location = New-Object System.Drawing.Point(13, 35)
    $txtComputerName.Name = "txtComputerName"
    $txtComputerName.TabIndex = 1
    $txtComputerName.Size = New-Object System.Drawing.Size(200,70)
    $txtComputerName.visible=$TRUE
	#
	# lblServicePack
	#
	$lblServicePack.DataBindings.DefaultDataSourceUpdateMode = [System.Windows.Forms.DataSourceUpdateMode]::OnValidation 
	$lblServicePack.Font = New-Object System.Drawing.Font("Lucida Console",8.25,1,3,1)
	$lblServicePack.Location = New-Object System.Drawing.Point(13,100)
	$lblServicePack.Name = "lblServicePack"
	$lblServicePack.Size = New-Object System.Drawing.Size(278,23)
	$lblServicePack.TabIndex = 0
	$lblServicePack.Text = "ServicePack"
	$lblServicePack.Visible = $False
	#
	# lblOS
	#
	$lblOS.DataBindings.DefaultDataSourceUpdateMode = [System.Windows.Forms.DataSourceUpdateMode]::OnValidation 
	$lblOS.Font = New-Object System.Drawing.Font("Lucida Console",8.25,1,3,1)
	$lblOS.Location = New-Object System.Drawing.Point(12,77)
	$lblOS.Name = "lblOS"
	$lblOS.Size = New-Object System.Drawing.Size(278,23)
	$lblOS.TabIndex = 2
	$lblOS.Text = "Service Information"
	$lblOS.Visible = $False
	#
	# statusBar1
	#
	$statusBar1.DataBindings.DefaultDataSourceUpdateMode = [System.Windows.Forms.DataSourceUpdateMode]::OnValidation 
	$statusBar1.Location = New-Object System.Drawing.Point(0,365)
	$statusBar1.Name = "statusBar1"
	$statusBar1.Size = New-Object System.Drawing.Size(390,22)
	$statusBar1.TabIndex = 5
	$statusBar1.Text = "statusBar1"


 #
 # chart1
 #
 $chart1.Anchor = [System.Windows.Forms.AnchorStyles]::Top -bor [System.Windows.Forms.AnchorStyles]::Bottom -bor [System.Windows.Forms.AnchorStyles]::Left -bor [System.Windows.Forms.AnchorStyles]::Right 
 $chart1.BackGradientStyle = [System.Windows.Forms.DataVisualization.Charting.GradientStyle]::TopBottom 
 $System_Windows_Forms_DataVisualization_Charting_ChartArea_1 = New-Object System.Windows.Forms.DataVisualization.Charting.ChartArea
 $System_Windows_Forms_DataVisualization_Charting_ChartArea_1.Area3DStyle.Enable3D = $True
 $System_Windows_Forms_DataVisualization_Charting_ChartArea_1.AxisX.Title = "Disk"
 $System_Windows_Forms_DataVisualization_Charting_ChartArea_1.AxisY.Title = "Disk Space (MB)"
 $System_Windows_Forms_DataVisualization_Charting_ChartArea_1.Name = "ChartArea1"

 [void]$chart1.ChartAreas.Add($System_Windows_Forms_DataVisualization_Charting_ChartArea_1)
 $chart1.DataBindings.DefaultDataSourceUpdateMode = [System.Windows.Forms.DataSourceUpdateMode]::OnValidation 
 $chart1.Location = New-Object System.Drawing.Point(13,200)
 $chart1.Name = "chart1"
 $System_Windows_Forms_DataVisualization_Charting_Series_2 = New-Object System.Windows.Forms.DataVisualization.Charting.Series
 $System_Windows_Forms_DataVisualization_Charting_Series_2.ChartArea = "ChartArea1"
 $System_Windows_Forms_DataVisualization_Charting_Series_2.ChartType = [System.Windows.Forms.DataVisualization.Charting.SeriesChartType]::Pie 
 $System_Windows_Forms_DataVisualization_Charting_Series_2.CustomProperties = "DrawingStyle=Cylinder, PieDrawingStyle=Concave"
 $System_Windows_Forms_DataVisualization_Charting_Series_2.IsVisibleInLegend = $False
 $System_Windows_Forms_DataVisualization_Charting_Series_2.Legend = "Legend1"
 $System_Windows_Forms_DataVisualization_Charting_Series_2.Name = "Disk Space"

 [void]$chart1.Series.Add($System_Windows_Forms_DataVisualization_Charting_Series_2)
 $chart1.Size = New-Object System.Drawing.Size(600,350)
 $chart1.TabIndex = 0
 $chart1.Text = "chart1"
 $System_Windows_Forms_DataVisualization_Charting_Title_3 = New-Object System.Windows.Forms.DataVisualization.Charting.Title
 $System_Windows_Forms_DataVisualization_Charting_Title_3.Alignment = [System.Drawing.ContentAlignment]::TopCenter 
 $System_Windows_Forms_DataVisualization_Charting_Title_3.DockedToChartArea = "ChartArea1"
 $System_Windows_Forms_DataVisualization_Charting_Title_3.IsDockedInsideChartArea = $False
 $System_Windows_Forms_DataVisualization_Charting_Title_3.Name = "Title1"
 $System_Windows_Forms_DataVisualization_Charting_Title_3.Text = "Disk Space"

 [void]$chart1.Titles.Add($System_Windows_Forms_DataVisualization_Charting_Title_3)
 #

 #Save the initial state of the form
 $InitialFormWindowState = $formDiskSpacePieChart.WindowState
 #Init the OnLoad event to correct the initial state of the form
 $formDiskSpacePieChart.add_Load($Form_StateCorrection_Load)
 #Show the Form
 return $formDiskSpacePieChart.ShowDialog()

} #End Function


if(OnApplicationLoad -eq $true)
{
	#Create the form
	#Call-SystemInformation_pff | Out-Null
    #Call-Disk_Space_Chart_pff | Out-Null
    Call-SystemInformation_pff | Out-Null
	#Perform cleanup
	OnApplicationExit
}