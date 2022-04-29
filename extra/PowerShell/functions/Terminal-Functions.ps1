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
