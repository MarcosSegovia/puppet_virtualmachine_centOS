file{'testfile':
        path => '/tmp/tesfile',

        ensure => present,
        mode => '0640',
        content => "YUPI !"
}