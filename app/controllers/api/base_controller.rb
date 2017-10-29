module Api
  class BaseController < ActionController::Base
    before_action :find_user_from_rss_token
    before_action :require_logged_in_user

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
  end
end
