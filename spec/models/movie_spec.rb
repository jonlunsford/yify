require 'spec_helper'

describe Yify::Models::Movie do
  it { should respond_to(:download_count) }
  it { should respond_to(:like_count) }
  it { should respond_to(:rt_critics_score) }
  it { should respond_to(:rt_critics_rating) }
  it { should respond_to(:rt_audience_score) }
  it { should respond_to(:rt_audience_rating) }
  it { should respond_to(:description_intro) }
  it { should respond_to(:description_full) }
  it { should respond_to(:yt_trailer_code) }
  it { should respond_to(:images) }
  it { should respond_to(:directors) }
  it { should respond_to(:actors) }
end

