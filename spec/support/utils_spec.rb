require 'spec_helper'

describe Yify::Support::Utils do
  let(:hash) { { "MovieTitle" => "Test", "MovieId" => "1234"  } }

  it "should underscore symbolize hash keys" do
    expect(subject.symbolize_keys(hash)).to have_key(:movie_title)
  end
end
