# Exchange Online
Import-PSSession $(New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://ps.outlook.com/powershell/ -Credential $(Import-Clixml -Path "$home\Documents\office365.xml") -Authentication Basic -AllowRedirection)

#Compliance and Security Center
Import-PSSession $(New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://ps.compliance.protection.outlook.com/powershell-liveid -Credential $(Import-Clixml -Path "$home\Documents\office365.xml") -Authentication Basic -AllowRedirection) -AllowClobber -DisableNameChecking 

# SharePoint
Connect-SPOService -Url https://stonybrookmedicine-admin.sharepoint.com -Credential $(Import-Clixml -Path "$home\Documents\office365.xml") -Authentication Basic -AllowRedirection

# Skype
Import-PSSession $(New-CsOnlineSession -Credential $(Import-Clixml -Path "$home\Documents\office365.xml"))

# Microsoft Online
 Connect-MsolService -Credential $(Import-Clixml -Path "$home\Documents\office365.xml") 