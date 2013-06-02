#Launches default browser to 'http://localhost/<blogname>/wp-admin/install.php'

puts "What was your site name from step4?"
name = gets.chomp()
system ( "xdg-open http://localhost/#{name}/wp-admin/install.php" )

