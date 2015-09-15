require 'httparty'
require 'dotenv'
require 'yify/support/utils.rb'
require 'yify/models/base.rb'
require 'yify/models/torrent.rb'
require 'yify/models/person_base.rb'
require 'yify/models/director.rb'
require 'yify/models/actor.rb'
require 'yify/models/movie_base.rb'
require 'yify/models/downloaded_movie.rb'
require 'yify/models/upcoming_movie.rb'
require 'yify/models/listed_movie.rb'
require 'yify/models/requested_movie.rb'
require 'yify/models/movie.rb'
require 'yify/models/comment.rb'
require 'yify/models/user.rb'
require 'yify/models/profile.rb'
require 'yify/models/api_response.rb'
require 'yify/models/session.rb'
require 'yify/response'
require 'yify/client'

Dotenv.load

module Yify
  autoload :VERSION, File.join(File.dirname(__FILE__), 'yify/version');
end
