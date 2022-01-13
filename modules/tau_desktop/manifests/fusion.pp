class tau_desktop::fusion {
  exec {
    'install fusion 360':
      # FIXME: Have to repeat $installerdir here b/c Windows does *not* like
      # forward slash.
      command => '"\\\\data-tausd\Shares\Technology\Installers\Fusion 360 Admin Install.exe" --quiet',
      creates => 'C:/Program Files/Autodesk/webdeploy/production/6a0c9611291d45bb9226980209917c3d/FusionLauncher.exe',
      timeout => 0;
  }
}
