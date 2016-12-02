name             'tomcat-liatrio'
maintainer       'Liatrio'
maintainer_email 'drew@liatrio.com'
license          'All rights reserved'
description      'Wrapper cookbook that Installs/Configures archiva-liatrio'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.1'

depends 'java', '~> 1.42.0'
depends 'tomcat', '~> 2.0.2'
