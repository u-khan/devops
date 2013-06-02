# Renames wordpress folder and uploads files to '/var/www/'
# Run with 'rvmsudo ruby step4.rb'

puts "Enter name of blog"
blog_name = gets.chomp()

system ( "mv ~/wordpress ~/#{blog_name}" )
system ( "mv ~/#{blog_name} /var/www/" )
