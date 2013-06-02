require_relative "lamp.rb"
require_relative "step1.rb"
require_relative "step2.rb"
require_relative "step3.rb"
require_relative "step4.rb"
require_relative "step5.rb"

def main
  puts
  puts "Hi!"
  # For lamp.rb
  puts "Enter a password for the MySQL server 'root' user:"
  mysql_root_pass = gets.chomp()
  
  # For step2.rb and step3.rb
  puts "Enter name of database to be created:"
  new_db_name = gets.chomp()
  puts "Enter a username for new database user:"
  new_db_user = gets.chomp()
  puts "Enter a password for new user:"
  newuser_pass = gets.chomp()
  
  # For step4.rb and step5.rb
  puts "Enter a folder name for the wordpress site:"
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
  
  
