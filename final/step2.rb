require 'mysql2'

def create_db_and_user(db_root_pass, db_name, db_user, db_u_pass)
  @db_host = "localhost"
  @db_user = "root"
  @db_pass = db_root_pass
  @db_name = db_name
  @db_new_user = db_user
  @db_new_pass = db_u_pass

  client = Mysql2::Client.new(:host => @db_host, :username => @db_user, :password => @db_pass)
  client.query( "CREATE DATABASE #{@db_name};" )
  client.query( "GRANT ALL PRIVILEGES ON #{@db_name}.* TO \"#{@db_new_user}\"@\"#{@db_host}\" IDENTIFIED BY \"#{@db_new_pass}\";" )
  client.query ( "FLUSH PRIVILEGES;" )
  client.close
end
