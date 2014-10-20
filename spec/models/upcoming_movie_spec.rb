require 'spec_helper'

describe Yify::Models::UpcomingMovie do
  it { should respond_to(:movie_title) }
  it { should respond_to(:movie_cover) }
  it { should respond_to(:imdb_code) }
  it { should respond_to(:imdb_link) }
  it { should respond_to(:uploader) }
  it { should respond_to(:uploader_uid) }
  it { should respond_to(:date_added) }
  it { should respond_to(:date_added_epoch) }
  it { should respond_to(:username) }
end
