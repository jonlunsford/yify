require "yify"
require "vcr"
require "pry"

VCR.configure do |c|
  c.cassette_library_dir = "spec/fixtures/vcr_cassettes"
  c.hook_into :webmock
end

RSpec.configure do |c|
  c.around(:each, :vcr) do |example|
    name = example.metadata[:full_description].split(/\s+/, 2).join("/").gsub(/[^\w\/]+/, "_")
    VCR.use_cassette(name) { example.call }
  end
end
