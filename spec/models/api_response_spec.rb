require 'spec_helper'

describe Yify::Models::ApiResponse do
  it { should respond_to(:status) }
  it { should respond_to(:error) }
end
