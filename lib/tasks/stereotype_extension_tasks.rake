namespace :radiant do
  namespace :extensions do
    namespace :stereotype do
      
      desc "Runs the migration of the Stereotype extension"
      task :migrate => :environment do
        puts "This extension does not affect the database. Nothing done."
      end
      
      desc "Copies public assets of the Stereotype to the instance public/ directory."
      task :update => :environment do
        puts "This extension has no public assets. Nothing done."
      end
    end
  end
end
