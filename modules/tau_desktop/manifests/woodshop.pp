class tau_desktop::woodshop {
  package {
    'Mastercam 2021':
      source => "${tau_desktop::installerdir}/mastercam2021-web.exe",
      install_options => [
        '-sp/silent /action=install /language=en-US',
      ];
    'CodeMeter Runtime Kit v7.30':
      source => "${tau_desktop::installerdir}/CodeMeterRuntime64.exe",
      install_options => [
        '/ComponentArgs',
        '"*":"/qn"',
      ];
  }

  # Install Mastercam 2021 postprocessors
  file {
    'C:/Users/Public/Documents/Shared Mastercam 2021/':
      ensure => directory,
      recurse => remote,
      source => "${tau_desktop::installerdir}/mastercam-2021-posts";
  }

  exec {
    'install fusion 360':
      # FIXME: Have to repeat $installerdir here b/c Windows does *not* like
      # forward slash.
      command => '"\\\\data-tausd\Shares\Technology\Installers\Fusion 360 Admin Install.exe" --quiet',
      creates => 'C:/Program Files/Autodesk/webdeploy/production/6a0c9611291d45bb9226980209917c3d/FusionLauncher.exe';
  }
}
