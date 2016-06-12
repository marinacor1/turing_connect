require 'rails_helper'

RSpec.feature "service can find index for all repos" do
  it "works", :vcr do
    user = User.create(github_id: "14285122", oauth_token: ENV["oauth_token"], screen_name: "marinacor1", name: "Marina Corona", city: "Denver", state: "CO")
    service = GithubService.new(user)
    all_repos = service.parse(service.get_following_feed)
    expect(all_repos).to eq("e")
  end
end
