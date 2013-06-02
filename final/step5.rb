def launch_browser(name)
  #Launches default browser to 'http://localhost/<blogname>/wp-admin/install.php'

  system ( "xdg-open http://localhost/#{name}/wp-admin/install.php" )
end
