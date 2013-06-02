require_relative "lamp.rb"
require_relative "step1.rb"
require_relative "step2.rb"
require_relative "step3.rb"
require_relative "step4.rb"
require_relative "step5.rb"

def main
  puts "Hi!"
  # For lamp.rb
  puts "Enter password for MySQL servers 'root' user"
  mysql_root_pass = gets.chomp()
  
  # For step2.rb and step3.rb
  puts "What is MySQL root password?"
  db_pass = gets.chomp()
  puts "What do you want the database to be called?"
  new_db_name = gets.chomp()
  puts "Enter username for new user"
  new_db_user = gets.chomp()
  puts "Enter new user password"
  newuser_pass = gets.chomp()
  
  # For step4.rb and step5.rb
  puts "Enter name of site to create"
  site_name = gets.chomp()
  
  install_lamp(mysql_root_pass)
  download_wordpress()
  create_db_and_user(mysql_root_pass, new_db_name, new_db_user, newuser_pass)
  edit_wp_config(new_db_name, new_db_user, newuser_pass)
  rename_and_move_wordpress(site_name)
  launch_browser(site_name)
  
end

if __FILE__ == $0
    main()
end 
  
  
