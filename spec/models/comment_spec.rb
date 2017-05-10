require "spec_helper"

describe Comment do
  it "should get a short id" do
    c = Comment.make!(:comment => "hello")

    c.short_id.should match(/^\A[a-zA-Z0-9]{1,10}\z/)
  end

  describe "destroy" do
    it "destroys its votes" do
      c = Comment.make!()

      expect {
        c.destroy
      }.to change(Vote, :count).by(-1)
    end
  end
end
