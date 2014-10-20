require 'spec_helper'

describe Yify::Response do
  let(:klass) { Yify::Response.new({}, :movie) }

  it "should expose a model" do
    expect(klass.model).to eq(:movie)
  end

  it "should expose a response" do
    expect(klass.response).to eq({})
  end

  it "should return a Movie" do
    expect(klass.result).to be_a(Yify::Models::Movie)
  end

  it "shout return a UpcomingMovie" do
    res = Yify::Response.new({}, :upcoming_movie)
    expect(res.result).to be_a(Yify::Models::UpcomingMovie)
  end

  it "should return a Comment" do
    res = Yify::Response.new({}, :comment)
    expect(res.result).to be_a(Yify::Models::Comment)
  end

  it "should return a User" do
    res = Yify::Response.new({}, :user)
    expect(res.result).to be_a(Yify::Models::User)
  end

  it "should return a Session" do
    res = Yify::Response.new({}, :session)
    expect(res.result).to be_a(Yify::Models::Session)
  end

  it "should return a Profile" do
    res = Yify::Response.new({}, :profile)
    expect(res.result).to be_a(Yify::Models::Profile)
  end

end
