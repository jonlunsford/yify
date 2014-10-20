require 'spec_helper'

describe Yify::Models::User do
  it { should respond_to(:user_id) }
  it { should respond_to(:user_name) }
  it { should respond_to(:join_dated) }
  it { should respond_to(:join_dated_epoch) }
  it { should respond_to(:last_seen_date) }
  it { should respond_to(:last_seen_date_epoch) }
  it { should respond_to(:torrents_downloaded_count) }
  it { should respond_to(:movies_requested_count) }
  it { should respond_to(:comment_count) }
  it { should respond_to(:chat_time_seconds) }
  it { should respond_to(:avatar) }
  it { should respond_to(:user_role) }
  it { should respond_to(:about) }
end
