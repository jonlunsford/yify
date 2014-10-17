require 'spec_helper'

class Dummy 
end

describe Yify::Support::Utils do

  let(:hash) { { "MovieTitle" => "Test", "MovieId" => "1234", "Nested" => { "ScreenShot1" => "http://..." } } }
  let(:array_hash) { { "MyKey" => [{ "ArrOne" => 1 }, { "ArrTwo" => 2 }] } }
  let(:klass) { Yify::Support::Utils.new }

  before do
    @dummy = Dummy.new
    @dummy.extend(Yify::Support::Utils)
  end

  it "should underscore symbolize hash keys" do
    expect(@dummy.symbolize_keys(hash)).to have_key(:movie_title)
  end

  it "should underscore symbolize keys recursively" do
    expect(@dummy.symbolize_keys(hash)[:nested]).to have_key(:screen_shot1)
  end
  
  it "should underscore symbolize arrays" do
    correct_array = [{ :arr_one => 1 }, { :arr_two => 2 }]

    expect(@dummy.symbolize_keys(array_hash)[:my_key]).to match_array(correct_array)
  end
end
