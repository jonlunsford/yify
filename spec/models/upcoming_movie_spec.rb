require 'spec_helper'

describe Yify::Models::UpcomingMovie do
  it { should respond_to(:title) }
  it { should respond_to(:year) }
  it { should respond_to(:imdb_code) }
  it { should respond_to(:medium_cover_image) }
  it { should respond_to(:date_added) }
  it { should respond_to(:date_added_unix) }
end
