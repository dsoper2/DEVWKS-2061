<# ex-01.ps1

Purpose:
    UCS Manager connect and query example
Author:
    John McDonough (jomcdono@cisco.com) github: (@movinalot)
    Cisco Systems, Inc.
#>

Import-Module Cisco.UCSManager

$creds = new-object -typename System.Management.Automation.PSCredential `
    -argumentlist "admin",$(convertto-securestring -Force -AsPlainText "password")

$ucsm_ip = "54.161.223.201"

Connect-Ucs -Name $ucsm_ip -Credential $creds

# Query UCS Manager
Get-UcsBlade
Get-UcsBlade | Select-Object Dn,Serial,Model
Get-UcsBlade -Xml

# Get Cmdlets are Class Based but can retrieve a Single Object 
Get-UcsBlade -Dn sys/chassis-3/blade-1 -Xml | Select-Object Dn, Serial, Model

Disconnect-Ucs
