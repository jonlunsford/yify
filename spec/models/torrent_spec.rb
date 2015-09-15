require 'spec_helper'

describe Yify::Models::Torrent do
  it { should respond_to(:url) }
  it { should respond_to(:hash) }
  it { should respond_to(:quality) }
  it { should respond_to(:resolution) }
  it { should respond_to(:framerate) }
  it { should respond_to(:seeds) }
  it { should respond_to(:peers) }
  it { should respond_to(:size) }
  it { should respond_to(:size_bytes) }
  it { should respond_to(:download_count) }
  it { should respond_to(:date_uploaded) }
  it { should respond_to(:date_uploaded_unix) }
end
