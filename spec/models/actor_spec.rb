require 'spec_helper'

describe Yify::Models::Actor do
  it { should be_kind_of(Yify::Models::PersonBase) }
  it { should respond_to(:character_name) }
end
