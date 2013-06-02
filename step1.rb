# Run with 'ruby wordpress.rb' (Don't use 'rvmsudo' or 'sudo' because it might lock the files)

# Download wordpress tar to home directory and extract
system ( "wget -P ~/ http://wordpress.org/latest.tar.gz" )
system ( "tar -xzvf ~/latest.tar.gz" )

