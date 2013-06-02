# Run with 'ruby wordpress.rb' (Don't use 'rvmsudo' or 'sudo' because it might lock the files)
def download_wordpress
  # Download wordpress tar to home directory and extract
  system ( "wget -P ~/ http://wordpress.org/latest.tar.gz" )
  system ( "tar -xzvf ~/latest.tar.gz -C ~/" )
end

# Delete the .tar downloaded file
# system ( "rm ~/latest.tar.gz" )


