host { 'localhost':
	ensure => 'present',
	target => '/etc/hosts',
	ip => '127.0.0.1',
	host_aliases => ['mysql']
}

$php_version = '56'


$misc_packages = ['vim-enhanced', 'telnet', 'zip']

package {
	$misc_packages: ensure => latest
}

include ::yum::repo::remi

if $php_version == '55' {
	include ::yum::repo::remi_php55
}
elsif $php_version == '56'{
	::yum::managed_yumrepo { 'remi-php56':
	  descr          => 'Les RPM de remi pour Enterpise Linux $releasever - $basearch - PHP 5.6',
	  mirrorlist     => 'http://rpms.famillecollet.com/enterprise/$releasever/php56/mirror',
	  enabled        => 1,
	  gpgcheck       => 1,
	  gpgkey         => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-remi',
	  gpgkey_source  => 'puppet:///modules/yum/rpm-gpg/RPM-GPG-KEY-remi',
	  priority       => 1,
	}
}

class { 'php': 
	version => 'latest',
	require => Yumrepo['remi-php56']
}
class { 'apache':  }
