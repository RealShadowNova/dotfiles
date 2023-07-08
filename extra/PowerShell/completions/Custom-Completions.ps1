Register-ArgumentCompleter -CommandName Set-JoshDevelopment-Location -ParameterName Repo -ScriptBlock {
  Get-ChildItem C:\Development\josh-development -Name -Directory
}

Register-ArgumentCompleter -CommandName Set-Development-Location -ParameterName Repo -ScriptBlock {
  Get-ChildItem C:\Development -Name -Directory
}