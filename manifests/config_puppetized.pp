file { '/etc/postfix/main.cf':
  source => '/vagrant/files/postfix_main_config.cf',
}
#exec { 'mail conf':
#  command => 'sudo echo "# This is some new conf\nsmtpd_sasl_auth_enable = yes" >> /etc/postfix/main.cf',
#  command => "sudo sed -i 's/inet_interfaces = localhost/inet_interfaces = all/' /etc/postfix/main.cf",
#  command => 'sudo chmod 0600 /var/mail/*',
#  command => "sudo sed -i '/mail\_location = mbox\:\~\/mail\:INBOX=\/var\/mail\/\%u/s/^#//g' /etc/dovecot/conf.d/10-mail.conf"
#  command => 'sudo sed -i "/^manager/d" /etc/aliases && newaliases'
#  command => 'printf "a login contractor conpass\na list '*' *\na logout\n" | openssl s_client -connect 127.0.0.1:143 -starttls imap'
#  command => 'printf "a login engineer engpass\na list '*' *\na logout\n" | openssl s_client -connect 127.0.0.1:143-starttls imap'
#  command => 'printf "a login manager manpass\na list '*' *\na logout\n" | openssl s_client -connect 127.0.0.1:143-starttls imap  
#}
#exec { 'pdns config':
#  command => 'sudo sed -i 's/#[[:space:]]local-port=/local-port=54/' /etc/pdns/pdns.conf',
#  command => 'sudo echo "bind-config=/etc/pdns/named.conf" >> /etc/pdns/pdns.conf',
#  command => 'sudo echo -e "zone \"youdidnotevenimaginethisdomainexists.com\" {\n    file \"/var/lib/pdns/youdidnote              venimaginethisdomainexists.com.db";\n    type master;\n};" > /etc/pdns/named.conf',
#  command => "sudo sed -i 's/#[[:space:]]forward-zones=/forward-zones=youdidnotevenimaginethisdomainexists.com=127.              0.0.1:54/' /etc/pdns-recursor/recursor.conf",
#  command => "sudo sed -i 's/#[[:space:]]local-port=53/local-port=53/' /etc/pdns-recursor/recursor.conf",
#  command => 'mkdir -p var/lib/pdns',
#  command => 'cp /vagrant/domaindb.com.db /var/lib/pdns/youdidnotevenimaginethisdomainexists.com.db',
#  command => "sudo nmcli con modify 'eth0' ipv4.dns '127.0.0.1'",
#}
#exec { 'run roundcube script':
#  command => 'sh /vagrant/configure_roundcube_apache.sh',
#}
#
