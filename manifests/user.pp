exec { 'Set hostname':
  command => '/usr/bin/hostnamectl set-hostname allinone-vl.localhost',
}
user { 'engineer2':
  ensure => present,
  password => '$6$xyz$.UccqMWqX8VK4PRzmKTR1woU2y5IgDas9n.XPkhgK8M62yVqI4sLx.Yw2AC5z7t4Ke3NiU7aq7i3Su5QdrRcF1',
}
user { 'manager2':
  ensure => present,
  password => '$6$xyz$PcPt/h72LIQm.YoxBmDLqfpbX1w3vhcJ1LwyYjOaslRr67l0g3ZkE5nKN0c4Ed98wYTvMWvhlGcV7NZorCE2i/',
}
user { 'contractor2':
  ensure => present,
  password => '$6$xyz$tlQI91A01E6TWfFL6jqBSSLdzLKJtFyF2aWfdTZyOBUn56UjQbMyecGla5IMGqX./neusxkBsr3IwUGZhTnel0',
}

