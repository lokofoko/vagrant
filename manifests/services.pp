$services = ['postfix',
             'dovecot', 'pdns', 'pdns-recursor'] 
service {  $services:
  ensure => running,
  enable => true,
  hasstatus => true,
}
