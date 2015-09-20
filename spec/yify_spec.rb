require "spec_helper"

describe Yify::Client do

  it "should include httparty" do
    expect(subject.class).to respond_to(:get)
  end

  it "should have a base_uri configured" do
    expect(subject.class.base_uri).to eq("http://yts.to/api/v2")
  end

  it "should list movies", :vcr do
    response = subject.list_movies({ limit: 3 })
    expect(response.result.count).to eq(3)
  end

  it "should get movie details", :vcr do
    response = subject.movie_details({ movie_id: 353, with_images: true, with_cast: true })
    expect(response.result.title).to eq("Confessions of a Dangerous Mind")
  end

  it "should get movie suggestions", :vcr do
    response = subject.movie_suggestions(353)
    expect(response.result.first.title).to eq("The Insider")
  end

  it "should get movie comments", :vcr do
    response = subject.movie_comments(353)
    expect(response.result.first.comment_text).to eq("thank you")
  end

  it "should get movie reviews", :vcr do
    response = subject.movie_reviews(353)
    expect(response.result.first.user_rating).to eq(5)
  end

  it "should get movie parental guides", :vcr do
    response = subject.movie_parental_guides(353)
    expect(response.result.first.type).to eq("Nudity")
  end

  it "should get upcoming movies", :vcr do
    response = subject.list_upcoming
    expect(response.result.first.title).to eq("Double Impact")
  end

  it "should get user details", :vcr do
    response = subject.user_details({ user_id: 16, with_recently_downloaded: true })
    expect(response.result.username).to eq("YIFY")
  end

  it "should get a user key", :vcr do
    params = { application_key: ENV["application_key"], username: ENV["username"], password: ENV["password"] }
    request = subject.user_get_key(params)
    expect(request.response["status_message"]).to eq("User successfully logged in")
  end

  it "should get a user profile", :vcr do
    response = subject.user_profile(ENV["user_key"])
    expect(response.result.group).to eq("user")
  end

  it "should edit a user profile", :vcr do
    params = { application_key: ENV["application_key"], user_key: ENV["user_key"], about_text: "RUBY FTW!" }
    response = subject.user_edit_settings(params)
    expect(response.result.about_text).to eq("RUBY FTW!")
  end

  it "should register a user", :vcr do
    params = { application_key: ENV["application_key"], username: ENV["username"], password: ENV["password"], email: ENV["email"] }
    request = subject.user_register(params)
    expect(request.response["status_message"]).to eq("User was successfully registered")
  end

  it "should recover forgotten passwords", :vcr do
    params = { application_key: ENV["application_key"], email: ENV["email"] }
    request = subject.user_forgot_password(params)
    expect(request.response["status_message"]).to eq("Reset password code has been sent")
  end

  it "should reset a password", :vcr do
    params = { application_key: ENV["application_key"], reset_code: ENV["reset_code"], new_password: ENV["new_password"] }
    request = subject.user_reset_password(params)
    expect(request.response["status_message"]).to eq("User password was successfully changed")
  end

  it "should post a comment", :vcr do
    params = { hash: ENV["hash"], text: "RUBY FTW!", movieid: 353 }
    response = subject.post_comment(params)
    expect(response.result.status).to include("successfully posted comment")
  end

  it "should get requests list", :vcr do
    params = { page: "confirmed", limit: 2 }
    response = subject.requests(params)
    expect(response.result.first.movie_title_clean).to eq("American Wedding")
  end

  it "should add a request", :vcr do
    params = { hash: ENV["hash"], request: "tt0111161" }
    response = subject.make_request(params)
    expect(response.result.error).to include("Movie has already been uploaded")
  end

  it "should vote on requests", :vcr do
    params = { hash: ENV["hash"], requestid: "1169" }
    response = subject.vote(params)
    expect(response.result.status).to include("Vote submission successful")
  end
end

