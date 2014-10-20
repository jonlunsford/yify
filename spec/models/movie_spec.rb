require 'spec_helper'

describe Yify::Models::Movie do
  it { should respond_to(:age_rating) }
  it { should respond_to(:cast_list) }
  it { should respond_to(:cover_image) }
  it { should respond_to(:date_uploaded) }
  it { should respond_to(:date_uploaded_epoch) }
  it { should respond_to(:director_list) }
  it { should respond_to(:downloaded) }
  it { should respond_to(:frame_rate) }
  it { should respond_to(:genre) }
  it { should respond_to(:genre1) }
  it { should respond_to(:genre2) }
  it { should respond_to(:imdb_code) }
  it { should respond_to(:imdb_link) }
  it { should respond_to(:language) }
  it { should respond_to(:large_cover) }
  it { should respond_to(:large_screenshot1) }
  it { should respond_to(:large_screenshot2) }
  it { should respond_to(:large_screenshot3) }
  it { should respond_to(:long_description) }
  it { should respond_to(:medium_cover) }
  it { should respond_to(:medium_screenshot1) }
  it { should respond_to(:medium_screenshot2) }
  it { should respond_to(:medium_screenshot3) }
  it { should respond_to(:movie_count) }
  it { should respond_to(:movie_id) }
  it { should respond_to(:movie_rating) }
  it { should respond_to(:movie_runtime) }
  it { should respond_to(:movie_title) }
  it { should respond_to(:movie_title_clean) }
  it { should respond_to(:movie_url) }
  it { should respond_to(:movie_year) }
  it { should respond_to(:quality) }
  it { should respond_to(:resolution) }
  it { should respond_to(:short_description) }
  it { should respond_to(:size) }
  it { should respond_to(:size_byte) }
  it { should respond_to(:state) }
  it { should respond_to(:subtitles) }
  it { should respond_to(:torrent_hash) }
  it { should respond_to(:torrent_magnet_url) }
  it { should respond_to(:torrent_peers) }
  it { should respond_to(:torrent_seeds) }
  it { should respond_to(:torrent_url) }
  it { should respond_to(:uploader) }
  it { should respond_to(:uploader_uid) }
  it { should respond_to(:uploader_notes) }
  it { should respond_to(:youtube_trailer_id) }
  it { should respond_to(:youtube_trailer_url) }
end

