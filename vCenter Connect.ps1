if (Get-PSSnapin vmware* -ErrorAction SilentlyContinue) {
Write-Host "vSphere snapin already loaded, proceeding."
} else {
Write-Host "Loading vSphere snapin."
Add-pssnapin VMWare.VimAutomation.Core -ErrorAction SilentlyContinue
    if (Get-PSSnapin vmware* -ErrorAction SilentlyContinue) {
    Write-Host "vSphere snapin loaded"
    } else {
    Write-Host -ForegroundColor Red "Error loading vSphere snapin. Halting."
    Write-Host -ForegroundColor Red "VMware PowerCLI is required to run this script."
    break
    }
 }

    $vcenter = Read-Host "Please enter the IP for your vCenter server or VMware host"
    $date = Get-Date -uformat "%m-%d-%Y"

    if (Test-Connection -ComputerName $vcenter -Count 1){
    Write-Host "Please wait while we attempt to connect to $vcenter"
    Connect-VIServer -Server $vcenter <#-User $vcusername -Password $pw#> > $NULL 2>&1
    if (!($vcusername)) { $vcusername = [Environment]::UserName }
    Write-Host "Connected"
    } else {
    Write-Host -ForegroundColor Red "Halt: $vcenter is not reachable."
    break
    }

    