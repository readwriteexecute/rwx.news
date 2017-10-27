require "spec_helper"

RSpec.describe "API Story", type: :request do
  it "creates a story using an rss token" do
    user = User.make!
    tag = Tag.make!
    headers = { "CONTENT_TYPE" => "application/json", "Authorization" => user.rss_token }
    request = { story: {title: "Title", url: "http://google.com", tags_a: [tag.tag]}}

    post "/api/stories",
         params: request.to_json,
         headers: headers

    expect(response.status).to eq 201
  end
end
