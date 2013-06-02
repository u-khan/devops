def rename_and_move_wordpress(blog_name)
  # Renames wordpress folder and uploads files to '/var/www/'
  # Run with 'rvmsudo ruby step4.rb'

  system ( "mv ~/wordpress ~/#{blog_name}" )
  system ( "mv ~/#{blog_name} /var/www/" )
end
