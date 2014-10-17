require "spec_helper"

describe Yify::Client do

  it "should include httparty" do
    expect(subject.class).to respond_to(:get)
  end

  it "should have a base_uri configured" do
    expect(subject.class.base_uri).to eq("http://yts.re/api")
  end

  it "should get upcoming movies", :vcr do
    response = subject.upcoming
    expect(response.body).to include("Persecuted (2014)")
  end

  it "should list movies", :vcr do
    options = { limit: 1 }
    response = subject.list(options)
    expect(response["MovieList"].count).to eq(1)
  end

  it "should list by imdb id", :vcr do
    options = { imdb_id: ["tt0111161", "tt0068646"] }
    response = subject.list_imdb(options)
    expect(response["MovieList"][0]["MovieTitleClean"]).to eq("The Godfather")
  end

  it "should get movie details", :vcr do
    response = subject.movie(353)
    expect(response.result.movie_title_clean).to eq("We Were Soldiers")
  end

  it "should return a Movie instance" do
    VCR.use_cassette("Yify_Client/should_get_movie_details") do
      response = subject.movie(353)

      expect(response.result).to be_a(Yify::Models::Movie)
    end
  end

  it "should get movie comments", :vcr do
    response = subject.comments(353)
    expect(response[0]["CommentText"]).to eq("thanxxxxxxx")
  end

end
