require 'spec_helper'

describe Yify::Response do
  let(:res) { YAML.load_file(File.join(File.dirname(__FILE__), "fixtures", "movie.yml")) }

  it "accepts a raw response" do
    binding.pry
  end
end
