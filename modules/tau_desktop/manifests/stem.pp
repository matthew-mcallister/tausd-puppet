class tau_desktop::stem {
  include tau_desktop::fusion

  package {
    'GIMP 2.10.30':
      source => "${tau_desktop::installerdir}/gimp-2.10.30-setup.exe",
      install_options => ['/VERYSILENT', '/NORESTART', '/ALLUSERS'];
    'Inkscape 0.92.4':
      source => "${tau_desktop::installerdir}/inkscape-0.92.4-x64.msi";
    'blender':
      source => "${tau_desktop::installerdir}/blender-3.0.0-windows-x64.msi";
  }
}
