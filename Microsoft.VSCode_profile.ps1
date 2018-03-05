<#
Solution: vscode-profile
Purpose: To replicate Powershell ISE Addons i require
Version: 0.1

This script is provided "AS IS" with no warranties, confers no rights and
is not supported by the authors or Deployment Artist.

    Author : Andy Friar
    Twitter: @Andy_Friar
    Website: http://www.novus.co.uk

Trying to credit the original addon created will update when i find the original link.
#>

# Connect to Exchange Online
function Connect-EO {
    $o365Cred = Get-Credential
    $o365Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://ps.outlook.com/powershell/ -Credential $o365Cred -Authentication Basic -AllowRedirection
    Import-PSSession $o365Session
}

# Connect to Skype
function Connect-Skype {
    $o365Cred = Get-Credential
    Import-Module SkypeOnlineConnector
    $sfboSession = New-CsOnlineSession -Credential $o365Cred
    Import-PSSession $sfboSession
}

# Connect to Security and Compliance
function Connect-SC {
    $o365Cred = Get-Credential
    $ccSession = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://ps.compliance.protection.outlook.com/powershell-liveid/ -Credential $o365Cred -Authentication Basic -AllowRedirection
    Import-PSSession $ccSession -Prefix cc
}