$httpd_name = 'apache'

file { '/tmp/123.txt':
  ensure => present
}
