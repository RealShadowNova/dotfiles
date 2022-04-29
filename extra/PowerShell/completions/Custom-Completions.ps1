Register-ArgumentCompleter -CommandName Set-JoshDevelopment-Location -ParameterName Repo -ScriptBlock {
  Get-ChildItem C:\Development\josh-development -Name -Directory
}