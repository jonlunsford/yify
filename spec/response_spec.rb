require 'spec_helper'

describe Yify::Response do
  let(:res) { YAML.load_file(File.join(File.dirname(__FILE__), "fixtures", "movie.yaml")) }
  let(:movie) { res["movie"].to_hash }
  let(:klass) { Yify::Response.new(res) }

  it "accepts a raw response" do
    expect(klass.response).to eq(res)
  end

  it "hydrates the Movie model" do
    expect
  end
end:L
