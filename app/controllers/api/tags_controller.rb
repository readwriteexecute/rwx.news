module Api
  class TagsController < BaseController
    def index
      @tags = Tag.all_with_story_counts_for(nil)
      render json: @tags
    end
  end
end
