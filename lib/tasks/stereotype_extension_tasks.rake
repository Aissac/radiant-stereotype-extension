namespace :radiant do
  namespace :extensions do
    namespace :stereotype do
      
      desc "Runs the migration of the Stereotype extension"
      task :migrate => :environment do
        require 'radiant/extension_migrator'
        if ENV["VERSION"]
          StereotypeExtension.migrator.migrate(ENV["VERSION"].to_i)
        else
          StereotypeExtension.migrator.migrate
        end
      end
      
      desc "Copies public assets of the Stereotype to the instance public/ directory."
      task :update => :environment do
        is_svn_or_dir = proc {|path| path =~ /\.svn/ || File.directory?(path) }
        puts "Copying assets from StereotypeExtension"
        Dir[StereotypeExtension.root + "/public/**/*"].reject(&is_svn_or_dir).each do |file|
          path = file.sub(StereotypeExtension.root, '')
          directory = File.dirname(path)
          mkdir_p RAILS_ROOT + directory
          cp file, RAILS_ROOT + path
        end
      end  
    end
  end
end
