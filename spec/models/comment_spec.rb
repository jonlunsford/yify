require 'spec_helper'

describe Yify::Models::Comment do
  it { should respond_to(:comment_id) }
  it { should respond_to(:comment_text) }
  it { should respond_to(:date_added) }
  it { should respond_to(:date_added_epoch) }
  it { should respond_to(:user_id) }
  it { should respond_to(:parent_comment_id) }
  it { should respond_to(:user_name) }
  it { should respond_to(:user_avatar) }
  it { should respond_to(:user_group) }
end
