require 'spec_helper'

describe Yify::Models::ListedMovie do
  it { should be_kind_of(Yify::Models::MovieBase) }
  it { should respond_to(:background_image) }
  it { should respond_to(:small_cover_image) }
  it { should respond_to(:medium_cover_image) }
  it { should respond_to(:state) }
end
