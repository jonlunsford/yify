require 'spec_helper'

describe Yify::Models::Comment do
  it { should respond_to(:comment_id) }
  it { should respond_to(:user_id) }
  it { should respond_to(:username) }
  it { should respond_to(:user_profile_url) }
  it { should respond_to(:small_user_avatar_image) }
  it { should respond_to(:medium_user_avatar_image) }
  it { should respond_to(:user_group) }
  it { should respond_to(:comment_text) }
  it { should respond_to(:date_added) }
  it { should respond_to(:date_added_unix) }
end
