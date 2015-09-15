require 'spec_helper'

describe Yify::Models::Base do

  module Yify
    module Models
      class Foo < Base
      end
    end
  end

  it "should create attributes dynamically" do
    model = Yify::Models::Base.new({ :hi => "hello" })
    expect(model.hi).to eq("hello")
  end

  it "should create attributes as models if they exist" do
    model = Yify::Models::Base.new({ :foos => [ :name => "I am foo" ] })
    expect(model.foos.first).to be_kind_of(Yify::Models::Foo)
  end
end
