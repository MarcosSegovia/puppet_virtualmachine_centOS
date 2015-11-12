
dir='/vagrant/modules/'

puppet module install puppetlabs/stdlib --modulepath $dir --version 4.9.0;
puppet module install puppetlabs/concat --modulepath $dir --version 1.2.4;
puppet module install example42/puppi --modulepath $dir --version 2.1.12;
puppet module install example42/yum --modulepath $dir --version 2.1.25;
puppet module install example42/php  --modulepath $dir --version 2.0.25;
puppet module install puppetlabs-apache --modulepath $dir --version 1.6.0;
puppet module install puppetlabs/apache --modulepath $dir --version 1.6.0;
