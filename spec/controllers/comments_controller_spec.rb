require "spec_helper"

describe CommentsController do
  describe "create" do
    let!(:user) { User.make! }
    let!(:story){ Story.make!(:created_at => 2.days.ago, :updated_at => 2.days.ago) }
    it "updates the updated_at for the parent story" do
      request.session[:u] = user.session_token
      expect {
        post(:create, params: {story_id: story.short_id, comment: "Hello"})
      }.to change{ story.reload.updated_at }

      expect(response).to be_success
    end
  end
end
