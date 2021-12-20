hiera_include('classes')

$_classes = lookup('classes')
notify { "classes applied by hiera: ${_classes}": }
