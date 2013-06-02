# Get input info from user
puts "What is the name of the database you created for WordPress in Step 2?"
db_name = gets.chomp()
puts "What is the username you created for WordPress in Step 2?"
db_user = gets.chomp()
puts "What is the password you chose for the WordPress username in Step 2?"
db_password = gets.chomp()


# Rename wp-config-sample.php to wp-config.php
system ( "mv  ~/wordpress/wp-config-sample.php ~/wordpress/wp-config.php" )

# Gets wordpress secret keys and updates specified file 'wp-config.php' with them
require 'open-uri'

# Gets generated secret keys
secret_keys = open('https://api.wordpress.org/secret-key/1.1/salt/').read()

# Stores secret keys in array
secret_array = []

secret_keys.each_line { |line|
  secret_array << line
}

path = '/home/umar/wordpress/wp-config.php'
lines = IO.readlines(path).map do |line|
  key = line.split(",")[0]
  
  # Replaces line by line. Would be better if could do block text paste
  case key
  when "define('DB_NAME'"
    "define('DB_NAME', '#{db_name}');"
  when "define('DB_USER'"
    "define('DB_USER', '#{db_user}');"
  when "define('DB_PASSWORD'"
    "define('DB_PASSWORD', '#{db_password}');"
  when "define('AUTH_KEY'"
    secret_array[0]
  when "define('SECURE_AUTH_KEY'"
    secret_array[1]
  when "define('LOGGED_IN_KEY'"
    secret_array[2]
  when "define('NONCE_KEY'"
    secret_array[3]
  when "define('AUTH_SALT'"
    secret_array[4]
  when "define('SECURE_AUTH_SALT'"
    secret_array[5]
  when "define('LOGGED_IN_SALT'"
    secret_array[6]
  when "define('NONCE_SALT'"
    secret_array[7]
  else
    line
  end
end
File.open(path, 'w') do |file|
  file.puts lines
end


# Block below was first attempt. Doesn't seem to work even though output file looks correct.
=begin
# Edits wp-config.php with the new secret keys
require 'tempfile'
require 'fileutils'

# Specifies path to wp-config.php
path = '/home/umar/wordpress/wp-config.php'
temp_file = Tempfile.new('foo')
begin
  File.open(path, 'r') do |file|
    file.each_line do |line|
      key = line.split(",")[0]
      
      # Replaces line by line. Would be better if could do block text paste
      case key
      when "define('DB_NAME'"
        temp_file.puts "define('DB_NAME', '#{db_name}');"
      when "define('DB_USER'"
        temp_file.puts "define('DB_USER', '#{db_user}');"
      when "define('DB_PASSWORD'"
        temp_file.puts "define('DB_PASSWORD', '#{db_password}');"
      when "define('AUTH_KEY'"
        temp_file.puts secret_array[0]
      when "define('SECURE_AUTH_KEY'"
        temp_file.puts secret_array[1]
      when "define('LOGGED_IN_KEY'"
        temp_file.puts secret_array[2]
      when "define('NONCE_KEY'"
        temp_file.puts secret_array[3]
      when "define('AUTH_SALT'"
        temp_file.puts secret_array[4]
      when "define('SECURE_AUTH_SALT'"
        temp_file.puts secret_array[5]
      when "define('LOGGED_IN_SALT'"
        temp_file.puts secret_array[6]
      when "define('NONCE_SALT'"
        temp_file.puts secret_array[7]
      else
        temp_file.puts line
      end
      
    end
  end
  temp_file.rewind
  FileUtils.mv(temp_file.path, path)
ensure
  temp_file.close
  temp_file.unlink
end
=end





