$essential_packages = ['epel-release','vim', 'cockpit', 'sos', 'postfix', 'bash-completion', 'man-pages', 'nc', 
                       'telnet', 'dovecot', 'cyrus-sasl', 'cyrus-sasl-plain', 'pdns', 'pdns-recursor', 
                       'bind-utils']
package { $essential_packages:
   ensure => installed,
}
