Dim WshShell, fso, botDir, psFile

Set WshShell = CreateObject("WScript.Shell")
Set fso      = CreateObject("Scripting.FileSystemObject")

botDir = fso.GetParentFolderName(WScript.ScriptFullName)
psFile = botDir & "\start_bot.ps1"

' Chay PowerShell script an (khong hien cua so)
WshShell.Run "powershell -ExecutionPolicy Bypass -WindowStyle Hidden -File """ & psFile & """", 0, False
