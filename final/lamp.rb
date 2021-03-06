# exec command doesn't work because only 1 command is executed.
# exec("mkdir umar")

# Run with 'rvmsudo ruby text.rb'

def install_lamp(mysql_root_pass)

  # Update repository
  system ( "apt-get update" )
  system ( "apt-get -y upgrade" )
    
  # Install MySQL
  system ( "echo mysql-server mysql-server/root_password password #{mysql_root_pass} | sudo debconf-set-selections" )
  system ( "echo mysql-server mysql-server/root_password_again password #{mysql_root_pass} | sudo debconf-set-selections" )
  system ( "apt-get -y install mysql-server mysql-client" )

  # Install Apache
  system ( "apt-get -y install apache2" )

  # Install PHP
  system ( "apt-get -y install php5 libapache2-mod-php5 php5-mysql" )

  # Restart Apache
  system ( "/etc/init.d/apache2 restart" )

  # Install MySQL development headers and 'mysql2' ruby gem (needed for ruby->mysql interaction)
  system ( "apt-get install libmysqlclient-dev")
  system ( "gem install mysql2" )

  # Install phpMyAdmin (skipped for now)
  # system ( "sudo apt-get -y install phpmyadmin" )

  puts "LAMP Installed"
end
  
  


