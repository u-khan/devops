# exec command doesn't work because only 1 command is executed.

#exec("mkdir umar")
#exec("rmdir umar")

# Run with 'rvmsudo ruby text.rb'

system( "echo 'hi'" )

# Update repository
system ( "apt-get update" )
system ( "apt-get -y upgrade" )
  
# Install MySQL
system ( "apt-get -y install mysql-server mysql-client" )

# Install Apache
system ( "apt-get -y install apache2" )

# Install PHP
system ( "apt-get -y install php5 libapache2-mod-php5 php5-mysql" )

# Restart Apache
system ( "/etc/init.d/apache2 restart" )

# Install phpMyAdmin
system ( "sudo apt-get -y install phpmyadmin" )

puts "Done Everything"
  
  


