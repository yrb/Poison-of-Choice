require 'rake'

TITLE = "Vim"
TAGLINE = "It's a kind of magic."

vimlander_path = File.dirname(__FILE__)
install_mappings = {'.' => '~/.vim', 'vimrc' => '~/.vimrc', }

desc 'Install'
task :install do
	# Check than we are not going to run over any existing files
	install_mappings.each do |source, destination|
		destination = File.expand_path(destination) 	
		if File.exists? destination or File.symlink? destination 
			abort "Cannot install safely, destination \"#{destination}\" already exists." 
		end
	end

	install_mappings.each do |source, destination|
		source = File.join vimlander_path, source
		destination = File.expand_path destination
		FileUtils.symlink source, destination
	end

	puts "Installed #{TITLE} - #{TAGLINE}"
end


desc 'Uninstall'
task :uninstall do
	install_mappings.each do |source, destination|
		destination = File.expand_path destination
		if File.symlink? destination
			FileUtils.safe_unlink destination
		else
			puts "\"#{destination}\" is not a symlink." if File.exists? destination 
		end	
	end

	puts "Uninstalled #{TITLE}"
end

task :default => ['install']
