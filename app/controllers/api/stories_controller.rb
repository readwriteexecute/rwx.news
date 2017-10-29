module Api
  class StoriesController < BaseController
    def create
      @story = Story.new(story_params)
      @story.user_id = @user.id

      if @story.valid? && !(@story.already_posted_story && !@story.seen_previous)
        if @story.save
          render json: @story, status: 201
          return
        end
      end
      render json: {}, status: 422
    end


    def story_params
      params.require(:story).permit(
        :title,
        :url,
        :description,
        :seen_previous,
        tags_a:  []
      )
    end
  end
end
