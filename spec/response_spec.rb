require 'spec_helper'

describe Yify::Response do
  let(:klass) { Yify::Response.new({}, :movie) }

  it "should expose a model" do
    expect(klass.model).to eq(:movie)
  end

  it "should expose a response" do
    expect(klass.response).to eq({})
  end

  it "should expose a result" do
    expect(klass.result).to be_a(Yify::Models::Movie)
  end
end
