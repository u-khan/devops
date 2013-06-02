require 'mysql2'

@db_host = "localhost"
@db_user = "root"
puts "What is MySQL root password?"
@db_pass = gets.chomp()
puts "What do you want the database to be called?"
@db_name = gets.chomp()
puts "Enter username for new user"
@db_new_user = gets.chomp()
puts "Enter new user password"
@db_new_pass = gets.chomp()

client = Mysql2::Client.new(:host => @db_host, :username => @db_user, :password => @db_pass)
client.query( "CREATE DATABASE #{@db_name}" )
client.query( "GRANT ALL PRIVILEGES ON #{@db_name}.* TO \"#{@db_new_user}\"@\"#{@db_host}\" IDENTIFIED BY \"#{@db_new_pass}\";" )
client.query ( "FLUSH PRIVILEGES;" )
client.close
