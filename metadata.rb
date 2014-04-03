name             'chef_app_db'
maintainer       'Fraser Scott'
maintainer_email 'admin@privacythroughchoice.org'

license          'MIT'
description      'Installs/Configures chef_app_db'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.1'

depends 'mysql'
depends 'database'
