class tau_desktop {
  $installerdir = '//data-tausd/Shares/Technology/Installers' 
  $crowdstrike_cid = lookup('crowdstrike_cid')

  # Classify nodes
  $hn = $trusted['hostname']
  if $hn =~ /^thd|^wed/ {
    include tau_desktop::crowdstrike
  }
  if $hn =~ /^...stf|^......stf|^...ofc|^...do/ {
    include tau_desktop::staff
  }
  if $hn =~ /^thd021|^thd014/ {
    include tau_desktop::woodshop
  }

  # This is a hack to work around lack of an ENC
  $stem_nodes = [
    'thlstu105816', 'thlstu105638', 'thlstu105803', 'thlstu105688',
    'thlstu105764', 'thlstu105750', 'thlstu105804', 'thlstu105749',
    'thlstu104543', 'thlstu104589', 'thlstu104590', 'thlstu104588',
    'thlstu105661', 'thlstu105419', 'thlstu105418', 'thlstu999888',
    'thlstu104540', 'thlstu105411', 'thlstu105697', 'thlstu105642',
  ]
  if $hn in $stem_nodes {
    include tau_desktop::stem
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
    'Mastercam 2020':
      uninstall_options => ['/silent'],
      ensure => absent;
  }
}
