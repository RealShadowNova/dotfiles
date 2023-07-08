Function .. {
	Set-Location ../
}

Function ... {
	Set-Location ../../
}

Function .... {
	Set-Location ../../../
}

Function ..... {
	Set-Location ../../../../
}

Function Remove-Files-Recursively-Forced {
	Param(
		[Parameter(ValueFromRemainingArguments = $True)]
		[String[]]$Paths
	)
	Process {
		ForEach ($path in $Paths) {
			Remove-Item -Recurse -Force -Path $path -ErrorAction Ignore
		}
	}
}

Function Update-Env {
	$env:Path = [System.Environment]::GetEnvironmentVariable('Path', 'Machine') + ';' + [System.Environment]::GetEnvironmentVariable('Path', 'User')
}

Function Set-Development-Location {
	[CmdletBinding()]
	Param (
		[Parameter(Mandatory = $False, ValueFromRemainingArguments = $False)]
		$Repo
	)

	Process {
		Set-Location -Path ( -join ('C:\Development\', $Repo))
	}
}

Function Set-JoshDevelopment-Location {
	[CmdletBinding()]
	Param (
		[Parameter(Mandatory = $False, ValueFromRemainingArguments = $False)]
		$Repo
	)

	Process {
		Set-Location -Path ( -join ('C:\Development\josh-development\', $Repo))
	}
}

Function x {
  exit;
}
