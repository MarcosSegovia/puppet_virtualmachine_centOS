host { 'localhost':
	ensure => 'present',
	target => '/etc/hosts',
	ip => '127.0.0.1',
	host_aliases => ['mysql']
}

$misc_packages = ['vim-enhanced', 'telnet', 'zip']

package {
	$misc_packages: ensure => latest
}