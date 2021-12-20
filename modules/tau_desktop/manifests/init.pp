class tau_desktop {
  $installerdir = '//data-tausd/Shares/Technology/Installers' 
  $crowdstrike_cid = lookup('crowdstrike_cid')

  # Classify nodes
  $hn = $trusted['hostname']
  if $hn =~ /^(th|we)[ld]/ {
    include tau_desktop
  }
  if $hn =~ /^thd|^wed/ {
    include tau_desktop::crowdstrike
  }
  if $hn =~ /^...stf|^......stf|^...ofc|^...do/ {
    include tau_desktop::staff
  }
  if $hn =~ /^thd021|^thd014/ {
    include tau_desktop::woodshop
  }

  package {
    'Google Chrome':
      source => "${installerdir}/GoogleChromeStandaloneEnterprise64.msi";
    'Google Drive':
      source => "${installerdir}/GoogleDriveSetup.exe",
      install_options => [
        '--silent',
        '--gsuite_shortcuts=false',
      ];
    'VLC media player 3.0.16 (64-bit)':
      source => "${installerdir}/vlc-3.0.16-win64.msi";
  }

  package {
    'Impero Client':
      ensure => absent;
    'Autodesk Configurator 360 admin':
      ensure => absent;
    'Autodesk Inventor Professional 2018':
      ensure => absent;
    'Autodesk ReCap':
      ensure => absent;
    'Autodesk Valut Basic 2018 (Client)':
      ensure => absent;
    'Steam':
      ensure => absent;
    'iboss Cloud Desktop App':
      ensure => absent;
  }
}
