name                'cis_policy_inetd_services'
maintainer          'Akash Siddharth'
maintainer_email    'akashsiddharth@knights.ucf.edu'
license             'Apache 2.0'
description         'Enforces the CIS inetd service benchmarks'
version             '0.1.0'
chef_version        '>= 14.0'
long_description    IO.read(File.join(File.dirname(__FILE__), 'README.md'))
source_url          'https://github.com/akashsiddharth/' if respond_to?(:source_url)
issues_url          'https://github.com/akashsiddharth/cassandra-chef-cookbook/issues' if respond_to?(:issues_url)
supports            ubuntu