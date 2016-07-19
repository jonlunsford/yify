require "yify"
require "vcr"

VCR.configure do |c|
  c.default_cassette_options = { :record => :new_episodes }
  c.cassette_library_dir = "spec/fixtures/vcr_cassettes"
  c.hook_into :webmock
  c.configure_rspec_metadata!
  c.filter_sensitive_data("<USERNAME>") { ENV["username"] }
  c.filter_sensitive_data("<USERNAME>") { ENV["username_variant"] }
  c.filter_sensitive_data("<PASSWORD>") { ENV["password"] }
  c.filter_sensitive_data("<NEW_PASSWORD>") { ENV["new_password"] }
  c.filter_sensitive_data("<EMAIL>") { ENV["email"] }
  c.filter_sensitive_data("<HASH>") { ENV["hash"] }
  c.filter_sensitive_data("<USER_ID>") { ENV["user_id"] }
  c.filter_sensitive_data("<IP_ADDRESS>") { ENV["ip_address"] }
  c.filter_sensitive_data("<APPLICATION_KEY>") { ENV["application_key"] }
  c.filter_sensitive_data("<USER_KEY>") { ENV["user_key"] }
  c.filter_sensitive_data("<PASSWORD_RESET_CODE>") { ENV["reset_code"] }
end

