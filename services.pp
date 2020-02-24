$services = ['epel-release','vim', 'cockpit', 'sos', 'postfix', 'bash-completion', 'man-pages', 'nc',
             'telnet', 'dovecot', 'cyrus-sasl', 'cyrus-sasl-plain', 'pdns', 'pdns-recursor',
             'bind-utils', 'bash-completion', 'postfix', 'dovecot', 'telnet'] 
service {  $services:
  ensure => running,
  enable => true,
  hasstatus => true,
}
