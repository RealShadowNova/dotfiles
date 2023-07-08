Function Get-Current-Git-Branch() {
	git rev-parse --abbrev-ref HEAD
}

function Get-Main-Git-Branch() {
	git show-ref -q --verify refs/heads/main

	if ($LastExitCode -eq 0) {
		Write-Output 'main'
	}
	else {
		Write-Output 'master'
	}
}

Function Get-All-Repos {
	Get-ChildItem -Directory -Hidden -Filter '.git' -Recurse -Depth 2 -Exclude node_modules | ForEach-Object {
		$dirname = $_
		Push-Location $dirname\..\

		Write-Host "Processing git status in ${dirname}" -ForegroundColor Green
		Clear-Branches -q

		$STATUS = $(git status | grep -v 'nothing to commit' | grep -v 'up-to-date' | grep -v '^On branch (?:master|main)$')

		if (Get-Variable 'STATUS' -ErrorAction 'Ignore') {
			Write-Host $STATUS | grep --color -E '^|behind|ahead|On branch .*'
		}

		if ($STATUS -like '*can be fast-forwarded*') {
			git pull
		}

		Write-Host '-------------' -ForegroundColor Gray
		Pop-Location
	}
}
