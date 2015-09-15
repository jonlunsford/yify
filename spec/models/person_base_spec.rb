require 'spec_helper'

describe Yify::Models::PersonBase do
  it { should respond_to(:name) }
  it { should respond_to(:small_image) }
  it { should respond_to(:medium_image) }
  it { should respond_to(:imdb_code) }
end
