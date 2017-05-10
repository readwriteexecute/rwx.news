task :delete_old_stories => :environment do
  Story.ready_for_deletion.each do |story|
    story.delete
  end
end
