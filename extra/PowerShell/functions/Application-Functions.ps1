function Install-Applications {
  $applications = @(
    # Programming & Tools
    @("Git.Git"),
    @("GitHub.cli"),
    @("GnuPG.Gpg4win"),
    @("OpenJS.NodeJS"),
    @("Microsoft.VisualStudioCode"),
    @("Microsoft.VisualStudio.2019.BuildTools"),
    @("Microsoft.WindowsTerminal"),
    @("JanDeDobbeleer.OhMyPosh"),
    @("Docker.DockerDesktop"),

    # Utilities
    @("Discord.Discord.Canary"),
    @("7zip.7zip.Alpha.msi"),
    @("OBSProject.OBSStudio"),
    @("Spotify.Spotify"),
    @("Ookla.Speedtest"),
    @("Nvidia.GeForceExperience"),

    # Games
    @("EpicGames.EpicGamesLauncher"),
    @("Valve.Steam")
  )

  Write-Host "Installing applications..."

  foreach ($application in $applications) {
    winget install -e --id $application
  }

  Write-Host "Applications installed."
}