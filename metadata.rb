name             'tomcat-liatrio'
maintainer       'Liatrio'
maintainer_email 'drew@liatrio.com'
license          'All rights reserved'
issues_url        'http://github.com/liatrio-chef/tomcat-liatrio'
source_url        'http://github.com/liatrio-chef/tomcat-liatrio'
description      'Wrapper cookbook that Installs/Configures archiva-liatrio'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.2'

depends 'java', '~> 1.42.0'
depends 'tomcat', '~> 2.3.4'
