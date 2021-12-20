class tau_desktop::crowdstrike {
  package { 'CrowdStrike Windows Sensor':
    source => "${installerdir}/WindowsSensor.MaverickGyr.exe",
    install_options => [
      '/install',
      '/norestart',
      '/quiet',
      '/log', 'C:\\crowdstrike-install.log',
      { 'CID' => "${crowdstrike_cid}" }
    ],
  }
}
