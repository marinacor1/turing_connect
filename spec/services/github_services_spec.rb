require 'rails_helper'

RSpec.feature "service can find index for all repos" do
  it "works" do
  VCR.use_cassette "repo lookup" do
    user = User.create(screen_name: "marinaco1", uid: "14285122", oauth_token: ENV["oauth_token"], name: "Marina Corona", image: "https://avatars.githubusercontent.com/u/14285122?v=3")
    service = GithubService.new(user)
    all_repos = service.parse(service.get_repos)
    expect(all_repos).to_not eq("e")
  end
  end
end
