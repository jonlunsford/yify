require "yify"
require "vcr"
require "pry-byebug"

VCR.configure do |c|
  c.cassette_library_dir = "spec/fixtures/vcr_cassettes"
  c.hook_into :webmock
  c.filter_sensitive_data("<USERNAME>") { ENV["username"] }
  c.filter_sensitive_data("<PASSWORD>") { ENV["password"] }
  c.filter_sensitive_data("<NEWPASSWORD>") { ENV["new_password"] }
  c.filter_sensitive_data("<EMAIL>") { ENV["email"] }
  c.filter_sensitive_data("<HASH>") { ENV["hash"] }
  c.filter_sensitive_data("<USERID>") { ENV["user_id"] }
  c.filter_sensitive_data("<IPADDRESS>") { ENV["ip_address"] }
end

RSpec.configure do |c|
  c.around(:each, :vcr) do |example|
    name = example.metadata[:full_description].split(/\s+/, 2).join("/").gsub(/[^\w\/]+/, "_")
    VCR.use_cassette(name) { example.call }
  end
end
