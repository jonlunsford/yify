require 'spec_helper'

describe Yify::Models::RequestedMovie do
  it { should respond_to(:movie_count) }
  it { should respond_to(:request_id) }
  it { should respond_to(:movie_title_clean) }
  it { should respond_to(:movie_year) }
  it { should respond_to(:movie_title) }
  it { should respond_to(:imdb_code) }
  it { should respond_to(:imdb_link) }
  it { should respond_to(:cover_image) }
  it { should respond_to(:short_description) }
  it { should respond_to(:genre) }
  it { should respond_to(:movie_rating) }
  it { should respond_to(:date_added) }
  it { should respond_to(:date_added_epoch) }
  it { should respond_to(:votes) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user_name) }
end
