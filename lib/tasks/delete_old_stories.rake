task :delete_old_stories => :environment do
  Story.destroy_old_stories
end
