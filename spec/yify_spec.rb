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

  # TODO POST requests, waiting on application_key from YTS
  it "should register a user", :vcr do
    options = { username: ENV["username"], password: ENV["password"], email: ENV["email"] }
    response = subject.register(options)
    expect(response.result.status).to include("An activation email has been sent")
  end

  it "should login a user", :vcr do
    options = { username: ENV["username"], password: ENV["password"] }
    response = subject.login(options)
    expect(response.result.hash).to eq(ENV["hash"])
  end

  it "should recover passwords", :vcr do
    response = subject.send_password_reset(ENV["email"])
    expect(response.result.status).to include("password reset code has been sent")
  end

  it "should reset a password", :vcr do
    options = { code: ENV["code"], newpassword: ENV["new_password"] }
    response = subject.reset_password(options)
    expect(response.result.status).to include("password has been changed")
  end

  it "should get a profile", :vcr do
    response = subject.profile(ENV["hash"])
    expect(response.result.user_id).to eq(ENV["user_id"].to_i)
  end

  it "should edit a profile", :vcr do
    options = { hash: ENV["hash"], about: "RUBY FTW!" }
    response = subject.update_profile(options)
    expect(response.result.status).to include("changes made successfully")
  end

  it "should post a comment", :vcr do
    options = { hash: ENV["hash"], text: "RUBY FTW!", movieid: 353 }
    response = subject.post_comment(options)
    expect(response.result.status).to include("successfully posted comment")
  end

  it "should get requests list", :vcr do
    options = { page: "confirmed", limit: 2 }
    response = subject.requests(options)
    expect(response.result.first.movie_title_clean).to eq("American Wedding")
  end

  it "should add a request", :vcr do
    options = { hash: ENV["hash"], request: "tt0111161" }
    response = subject.make_request(options)
    expect(response.result.error).to include("Movie has already been uploaded")
  end

  it "should vote on requests", :vcr do
    options = { hash: ENV["hash"], requestid: "1169" }
    response = subject.vote(options)
    expect(response.result.status).to include("Vote submission successful")
  end
end

