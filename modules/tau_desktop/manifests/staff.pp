class tau_desktop::staff {
  package {
    'vCastSender':
      source => "${installerdir}/vCastSender/vCastSender_v3.0.2.1013.msi";
    'Mozilla Firefox (x64 en-US)':
      source => "${installerdir}/FirefoxSetup93.0.msi";
  }
}
