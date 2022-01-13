class tau_desktop::woodshop {
  include tau_desktop::fusion

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
  # TODO: Should be an exec'd copy since this slows down runs
  file {
    'C:/Users/Public/Documents/Shared Mastercam 2021/':
      ensure => directory,
      recurse => remote,
      source => "${tau_desktop::installerdir}/mastercam-2021-posts";
  }
}
