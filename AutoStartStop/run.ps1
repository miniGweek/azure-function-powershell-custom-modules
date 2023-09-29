using namespace System.Net

# Input bindings are passed in via param block.
param($Request, $TriggerMetadata)

$OutPutLogs = @();

Function Log($Text) {
    Write-Host $Text
    return $Text
}

$OutPutLogs += Log "List modules loaded."
Get-Module

$OutPutLogs += Log "List modules loaded. -ListAvailable switch"
Get-Module -ListAvailable

$OutPutLogs += Log "Import Az.Accounts"
Import-Module Az.Accounts

$OutPutLogs += Log "Invoke Get-AzSubscription"
Get-AzSubscription

$OutPutLogs += Log "Invoke DevDebug.Get-LocalHelp"
Get-LocalHelp

# Associate values to output bindings by calling 'Push-OutputBinding'.
Push-OutputBinding -Name Response -Value ([HttpResponseContext]@{
        StatusCode = [HttpStatusCode]::OK
        Body       = $OutPutLogs
    })
