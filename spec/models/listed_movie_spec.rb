require 'spec_helper'

describe Yify::Models::ListedMovie do
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
  it { should respond_to(:language) }
  it { should respond_to(:mpa_rating) }
  it { should respond_to(:download_count) }
  it { should respond_to(:like_count) }
  it { should respond_to(:rt_critics_score) }
  it { should respond_to(:rt_critics_rating) }
  it { should respond_to(:rt_audience_score) }
  it { should respond_to(:rt_audience_rating) }
  it { should respond_to(:description_intro) }
  it { should respond_to(:description_full) }
  it { should respond_to(:yt_trailer_code) }
  it { should respond_to(:date_uploaded) }
  it { should respond_to(:date_uploaded_unix) }
  it { should respond_to(:background_image) }
  it { should respond_to(:small_cover_image) }
  it { should respond_to(:medium_cover_image) }
  it { should respond_to(:state) }
  it { should respond_to(:torrents) }

end
