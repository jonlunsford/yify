require 'spec_helper'

describe Yify::Models::MovieBase do
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
  it { should respond_to(:date_uploaded) }
  it { should respond_to(:date_uploaded_unix) }
  it { should respond_to(:torrents) }
end
