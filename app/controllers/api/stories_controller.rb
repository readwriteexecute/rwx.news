module Api
  class StoriesController < ActionController::Base
    before_action :find_user_from_rss_token
    before_action :require_logged_in_user

    def create
      @story = Story.new(story_params)
      @story.user_id = @user.id

      if @story.valid? && !(@story.already_posted_story && !@story.seen_previous)
        if @story.save
          render json: @story, status: 201
          return
        end
      end
      render status: 422
    end

    def find_user_from_rss_token
      if !@user && request.headers["Authorization"].to_s.present?
        @user = User.where(:rss_token => request.headers["Authorization"].to_s).first
      end
    end

    def require_logged_in_user
      if @user
        true
      else
        render json: {}, status: 401
      end
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
