<# ex-02.ps1

Purpose:
    UCS Manager query with Filters example
Author:
    John McDonough (jomcdono@cisco.com) github: (@movinalot)
    Cisco Systems, Inc.
#>

Import-Module Cisco.UCSManager

$creds = new-object -typename System.Management.Automation.PSCredential `
    -argumentlist "admin",$(convertto-securestring -Force -AsPlainText "password")

$ucsm_ip = "54.161.223.201"

Connect-Ucs -Name $ucsm_ip -Credential $creds

# PowerTool is case sensitive by default
Get-UcsBlade -Model UCSB-B200-M5 | Select-Object Dn, Serial, Model | Format-Table
Get-UcsBlade -Model ucsb-B200-M5 | Select-Object Dn, Serial, Model | Format-Table

# PowerShell is case insensitive by default
Get-UcsBlade | Where-Object {$_.Model -eq 'ucsb-B200-M5'} | Select-Object Dn, Serial, Model

# Filter Strings
Get-UcsBlade -Filter 'Model -ilike UcsB-b200-M4' -Xml | Select-Object Dn, Model
Get-UcsBlade -Filter 'Model -ilike UcsB-b200-M5' -Xml | Select-Object Dn, Model

Disconnect-Ucs
