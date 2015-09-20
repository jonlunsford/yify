require 'httparty'
require 'dotenv'
require 'yify/support/utils.rb'
require 'yify/models/base.rb'
require 'yify/models/torrent.rb'
require 'yify/models/director.rb'
require 'yify/models/actor.rb'
require 'yify/models/comment.rb'
require 'yify/models/movie.rb'
require 'yify/models/review.rb'
require 'yify/models/user.rb'
require 'yify/models/profile.rb'
require 'yify/models/api_response.rb'
require 'yify/models/parental_guide.rb'
require 'yify/models/session.rb'
require 'yify/models/bookmark.rb'
require 'yify/response'
require 'yify/client'

Dotenv.load

module Yify
  autoload :VERSION, File.join(File.dirname(__FILE__), 'yify/version');
end
