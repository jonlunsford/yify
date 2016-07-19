require "spec_helper"

describe Yify::Client do

  it "should include httparty" do
    expect(subject.class).to respond_to(:get)
  end

  it "should have a base_uri configured" do
    expect(subject.class.base_uri).to eq("https://yts.ag/api/v2")
  end

  it "should set an application_key" do
    client = Yify::Client.new(ENV["application_key"])
    expect(client.application_key).to eq(ENV["application_key"])
  end

  it "should set an application_key from an ENV variable" do
    client = Yify::Client.new
    expect(client.application_key).to eq(ENV["application_key"])
  end

  it "should list movies", :vcr do
    response = subject.list_movies({ limit: 3 })
    expect(response.result.count).to eq(3)
  end

  it "should get movie details", :vcr do
    response = subject.movie_details({ movie_id: 353, with_images: true, with_cast: true })
    expect(response.result.title).to eq("Back to the Future")
  end

  it "should get movie suggestions", :vcr do
    response = subject.movie_suggestions(353)
    expect(response.result.first.title).to eq("What Maisie Knew")
  end

  # ENDPOINT NO LONGER WORKS
  skip "should get movie comments", :vcr do
    response = subject.movie_comments(353)
    expect(response.result.first.comment_text).to eq("thank you")
  end

  # ENDPOINT NO LONGER WORKS
  skip "should get movie reviews", :vcr do
    response = subject.movie_reviews(353)
    expect(response.result.first.user_rating).to eq(5)
  end

  # ENDPOINT NO LONGER WORKS
  skip "should get movie parental guides", :vcr do
    response = subject.movie_parental_guides(353)
    expect(response.result.first.type).to eq("Nudity")
  end

  # ENDPOINT NO LONGER WORKS
  skip "should get upcoming movies", :vcr do
    response = subject.list_upcoming
    expect(response.result.first.title).to eq("Double Impact")
  end

  # ENDPOINT NO LONGER WORKS
  skip "should get user details", :vcr do
    response = subject.user_details({ user_id: 16, with_recently_downloaded: true })
    expect(response.result.username).to eq("YIFY")
  end

  # ENDPOINT NO LONGER WORKS
  skip "should get a user key", :vcr do
    params = { application_key: ENV["application_key"], username: ENV["username"], password: ENV["password"] }
    request = subject.user_get_key(params)
    expect(request.response["status_message"]).to eq("User successfully logged in")
  end

  # ENDPOINT NO LONGER WORKS
  skip "should get a user profile", :vcr do
    response = subject.user_profile(ENV["user_key"])
    expect(response.result.group).to eq("user")
  end

  # ENDPOINT NO LONGER WORKS
  skip "should edit a user profile", :vcr do
    params = { application_key: ENV["application_key"], user_key: ENV["user_key"], about_text: "RUBY FTW!" }
    response = subject.user_edit_settings(params)
    expect(response.result.about_text).to eq("RUBY FTW!")
  end

  # ENDPOINT NO LONGER WORKS
  skip "should register a user", :vcr do
    params = { application_key: ENV["application_key"], username: ENV["username"], password: ENV["password"], email: ENV["email"] }
    request = subject.user_register(params)
    expect(request.response["status_message"]).to eq("User was successfully registered")
  end

  # ENDPOINT NO LONGER WORKS
  skip "should recover forgotten passwords", :vcr do
    params = { application_key: ENV["application_key"], email: ENV["email"] }
    request = subject.user_forgot_password(params)
    expect(request.response["status_message"]).to eq("Reset password code has been sent")
  end

  # ENDPOINT NO LONGER WORKS
  skip "should reset a password", :vcr do
    params = { application_key: ENV["application_key"], reset_code: ENV["reset_code"], new_password: ENV["new_password"] }
    request = subject.user_reset_password(params)
    expect(request.response["status_message"]).to eq("User password was successfully changed")
  end

  # ENDPOINT NO LONGER WORKS
  skip "should like a movie", :vcr do
    params = { application_key: ENV["application_key"], user_key: ENV["user_key"], movie_id: 353 }
    request = subject.like_movie(params)
    expect(request.response["status_message"]).to eq("Movie has been successfully liked")
  end

  # ENDPOINT NO LONGER WORKS
  skip "should get movie bookmarks", :vcr do
    params = { user_key: ENV["user_key"], movie_id: 353, with_rt_rattings: true }
    response = subject.get_movie_bookmarks(params)
    expect(response.result.movies.first.id).to eq(353)
  end

  # ENDPOINT NO LONGER WORKS
  skip "should add a movie bookmark", :vcr do
    params = { user_key: ENV["user_key"], movie_id: 353 }
    request = subject.add_movie_bookmark(params)
    expect(request.response["status_message"]).to eq("Movie has been successfully bookmarked")
  end

  # ENDPOINT NO LONGER WORKS
  skip "should delete a movie bookmark", :vcr do
    params = { application_key: ENV["application_key"], user_key: ENV["user_key"], movie_id: 353 }
    request = subject.delete_movie_bookmark(params)
    expect(request.response["status_message"]).to eq("Movie bookmarked has been removed")
  end

  # ENDPOINT NO LONGER WORKS
  skip "should make a comment", :vcr do
    params = { application_key: ENV["application_key"], user_key: ENV["user_key"], movie_id: 353, comment_text: "Hello World!" }
    request = subject.make_comment(params)
    expect(request.response["status_message"]).to eq("Comment has been successfully submitted")
  end

  # ENDPOINT NO LONGER WORKS
  skip "should like a comment", :vcr do
    params = { application_key: ENV["application_key"], user_key: ENV["user_key"], comment_id: 379208 }
    request = subject.like_comment(params)
    expect(request.response["status_message"]).to eq("Comment has been successfully liked")
  end

  # ENDPOINT NO LONGER WORKS
  skip "should report a comment", :vcr do
    params = { application_key: ENV["application_key"], user_key: ENV["user_key"], comment_id: 379208 }
    request = subject.report_comment(params)
    expect(request.response["status_message"]).to eq("Comment has been successfully reported")
  end

  # ENDPOINT NO LONGER WORKS
  skip "should delete a comment", :vcr do
    params = { application_key: ENV["application_key"], user_key: ENV["user_key"], comment_id: 379208 }
    request = subject.delete_comment(params)
    expect(request.response["status_message"]).to eq("Comment has been successfully deleted")
  end

  # ENDPOINT NO LONGER WORKS
  skip "should make a request", :vcr do
    params = { application_key: ENV["application_key"], user_key: ENV["user_key"], movie_title: "Hello World!", request_message: "Please ignore this request!" }
    request = subject.make_request(params)
    expect(request.response["status_message"]).to eq("Request has been successfully submitted")
  end

end

