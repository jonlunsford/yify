require 'spec_helper'

describe Yify::Models::Session do
  it { should respond_to(:hash) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user_role) }
  it { should respond_to(:username) }
end
