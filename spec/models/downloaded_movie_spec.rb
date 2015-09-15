require 'spec_helper'

describe Yify::Models::DownloadedMovie do
  it { should respond_to(:id) }
  it { should respond_to(:url) }
  it { should respond_to(:imdb_code) }
  it { should respond_to(:title) }
  it { should respond_to(:title_long) }
  it { should respond_to(:slug) }
  it { should respond_to(:year) }
  it { should respond_to(:rating) }
  it { should respond_to(:runtime) }
  it { should respond_to(:genres) }
  it { should respond_to(:small_cover_image) }
  it { should respond_to(:medium_cover_image) }
end
