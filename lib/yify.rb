require 'httparty'
require 'yify/support/utils.rb'
require 'yify/models/base.rb'
require 'yify/models/movie.rb'
require 'yify/response'
require 'yify/client'

module Yify
  autoload :VERSION, File.join(File.dirname(__FILE__), 'yify/version');
end
