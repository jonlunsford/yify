# A ruby wrapper for the YIFY Torrents API (https://yts.to/api)

module Yify
  class Client
    include Yify::Support::Utils
    include HTTParty

    attr_accessor :application_key

    base_uri 'http://yts.to/api/v2'
    format :json

    def initialize(application_key = nil)
      @application_key = application_key || ENV["yify_application_key"]
    end

    # [GET] list_movies
    # See: https://yts.to/api#list_movies
    #
    # Get a list of movies, this method can be used to search
    # or filter.
    #
    # @params
    #   limit: Integer between 1 - 50 (inclusive)
    #   page: Integer
    #   quality: String
    #   minimum_rating Integer between 0 - 9 (inclusive)
    #   query_term: String
    #   genre: String
    #   sort_by: String (title, year, rating, peers, seeds, download_count, like_count, date_added)
    #   order_by: String (desc, asc)
    #   with_rt_ratting: Boolean (returns with rotten tomatoes rating)
    #
    # @returns [Yify::Models::Movie]

    def list_movies(params)
      data = self.class.get("/list_movies", { query: params })
      Yify::Response.new(data, :movies)
    end

    # [GET] movie_details
    # See: https://yts.to/api#movie_details
    #
    # Get movie details.
    #
    # @params
    #   movie_id: Integer (required)
    #   with_images: Boolean
    #   with_cast: Boolean
    #
    # @returns Yify::Models::Movie

    def movie_details(params)
      data = self.class.get("/movie_details", { query: params })
      Yify::Response.new(data, :movie)
    end

    # [GET] movie_suggestions
    # See: https://yts.to/api#movie_suggestions
    #
    # Returns 4 related movies as suggestions for the user
    #
    # @params
    #   movie_id: Integer (required)
    #
    # @returns [Yify::Models::Movie]

    def movie_suggestions(movie_id)
      data = self.class.get("/movie_suggestions", { query: { movie_id: movie_id } })
      Yify::Response.new(data, :movie_suggestions)
    end

    # [GET] movie_comments
    # See: https://yts.to/api#movie_comments
    #
    # Get comments for the desired movie
    #
    # @params
    #   movie_id: Integer (required)
    #
    # @returns [Yify::Models::Comment]

    def movie_comments(movie_id)
      data = self.class.get("/movie_comments", { query: { movie_id: movie_id } })
      Yify::Response.new(data, :comments)
    end

    # [GET] movie_reviews
    # See: https://yts.to/api#movie_reviews
    #
    # Get reviews for the desired movie
    #
    # @params
    #   movie_id: Integer (required)
    #
    # @returns [Yify::Models::Review]

    def movie_reviews(movie_id)
      data = self.class.get("/movie_reviews", { query: { movie_id: movie_id } })
      Yify::Response.new(data, :reviews)
    end

    # [GET] movie_parental_guides
    # See: https://yts.to/api#movie_parental_guides
    #
    # Get parental guides for the desired movie
    #
    # @params
    #   movie_id: Integer (required)
    #
    # @returns [Yify::Models::ParentalGuide]

    def movie_parental_guides(movie_id)
      data = self.class.get("/movie_parental_guides", { query: { movie_id: movie_id } })
      Yify::Response.new(data, :parental_guides)
    end

    # [GET] list_upcoming
    # See: https://yts.to/api#list_upcoming
    #
    # A list of all upcoming movies.
    #
    # @returns [Yify::Models::UpcomingMovie]

    def list_upcoming
      data = self.class.get("/list_upcoming")
      Yify::Response.new(data, :upcoming_movies)
    end

    # [GET] user_details
    # See: https://yts.to/api#user_details
    #
    # Get desired users' details.
    #
    # @params
    #   user_id: Integer (required)
    #   with_recently_downloaded: Boolean
    #
    # @returns Yify::Models::User

    def user_details(params)
      data = self.class.get("/user_details", { query: params })
      Yify::Response.new(data, :user)
    end

    # [POST] get_user_key
    # See: https://yts.to/api#get_user_key
    #
    # The same as logging in, if successful the returned data will
    # include the user_key for later use of the API as a means of authentication
    #
    # @params (all required)
    #   username: String
    #   password: String
    #   application_key: String
    #
    # @returns [Yify::Models::Session]

    def user_get_key(params)
      data = self.class.post("/user_get_key", { body: post_params(params) })
      Yify::Response.new(data, :session)
    end

    # [GET] user_profile
    # See: https://yts.to/api#user_profile
    #
    # Get a logged in user's profile.
    #
    # @params
    #   user_key: String (required) response from user_get_key
    #
    # @returns Yify::Models::User

    def user_profile(user_key)
      data = self.class.get("/user_profile", { query: { user_key: user_key } })
      Yify::Response.new(data, :user)
    end

    # [POST] user_edit_settings
    # See: https://yts.to/api#user_edit_settings
    #
    # update a logged in user's profile.
    #
    # @params
    #   user_key: String (required)
    #   application_key: String (required)
    #   new_password: String
    #   about_text: String
    #   avatar_image: img, jpg, jpef, gif, png (10MB max)
    #
    # @returns Yify::Models::User

    def user_edit_settings(params)
      data = self.class.post("/user_edit_settings", { body: post_params(params) })
      Yify::Response.new(data, :user)
    end

    # [POST] user_register
    # See: https://yts.to/api#user_register
    #
    # Register a new user with Yify.
    #
    # @params
    #   application_key: String (required)
    #   username: String (required)
    #   password: String (required)
    #   email: String (required)
    #
    # @returns Yify::Models::Session

    def user_register(params)
      data = self.class.post("/user_register", { body: post_params(params) })
      Yify::Response.new(data, :session)
    end

    # [POST] user_forgot_password
    # https://yts.to/api#user_forgot_password
    #
    # Send a password reset email to the specified email address.
    #
    # @params
    #   email: String (required)
    #   application_key: String (required)
    #
    # @returns Yify::Models::ApiResponse

    def user_forgot_password(params)
      data = self.class.post("/user_forgot_password", { body: post_params(params) })
      Yify::Response.new(data, :api_response)
    end

    # [POST] user_reset_password
    # See: https://yts.to/api#user_reset_password
    #
    # Reset the users' password.
    #
    # @params
    #   reset_code: String (required)
    #   new_password: String (required)
    #   application_key: String (required)
    #
    # @returns Yify::Models::Session

    def user_reset_password(params)
      data = self.class.post("/user_reset_password", { body: post_params(params) })
      Yify::Response.new(data, :session)
    end

    # [POST] like_movie
    # See: https://yts.to/api#like_movie
    #
    # Reset the users' password.
    #
    # @params
    #   user_key: String (required)
    #   movie_id: Integer (required)
    #   application_key: String (required)
    #
    # @returns Yify::Models::ApiResponse

    def like_movie(params)
      data = self.class.post("/like_movie", { body: post_params(params) })
      Yify::Response.new(data, :api_response)
    end

    # [GET] get_movie_bookmarks
    # See: https://yts.to/api#get_movie_bookmarks
    #
    # Get all the current movies which have been bookmarked for a given user
    #
    # @params
    #   user_key: String (required)
    #   with_rt_rattings: Boolean
    #
    # @returns [Yify::Models::Bookmark]

    def get_movie_bookmarks(params)
      data = self.class.get("/get_movie_bookmarks", { query: params })
      Yify::Response.new(data, :bookmarks)
    end

    # [POST] add_movie_bookmark
    # See: https://yts.to/api#add_movie_bookmark
    #
    # Get all the current movies which have been bookmarked for a given user
    #
    # @params
    #   user_key: String (required)
    #   movie_id: Integer (required)
    #   application_key: String (required)
    #
    # @returns Yify::Models::Bookmark

    def add_movie_bookmark(params)
      data = self.class.post("/add_movie_bookmark", { body: post_params(params) })
      Yify::Response.new(data, :bookmark)
    end

    # [POST] delete_movie_bookmark
    # See: https://yts.to/api#delete_movie_bookmark
    #
    # remove movies from the user's bookmarks
    #
    # @params
    #   user_key: String (required)
    #   movie_id: Integer (required)
    #   application_key: String (required)
    #
    # @returns Yify::Models::Bookmark

    def delete_movie_bookmark(params)
      data = self.class.post("/delete_movie_bookmark", { body: post_params(params) })
      Yify::Response.new(data, :api_response)
    end

    # [POST] make_comment
    # See: https://yts.to/api#make_comment
    #
    # Add comment to a movie.
    #
    # @params
    #   user_key: String (required)
    #   movie_id: Integer (required)
    #   comment_text: String (required)
    #   application_key: String (required)
    #
    # @returns Yify::Models::ApiResponse

    def make_comment(params)
      data = self.class.post("/make_comment", { body: post_params(params) })
      Yify::Response.new(data, :api_response)
    end

    # [POST] like_comment
    # See: https://yts.to/api#like_comment
    #
    # Like a comment on a movie
    #
    # @params
    #   user_key: String (required)
    #   comment_id: Integer (required)
    #   application_key: String (required)
    #
    # @returns Yify::Models::ApiResponse

    def like_comment(params)
      data = self.class.post("/like_comment", { body: post_params(params) })
      Yify::Response.new(data, :api_response)
    end

    # [POST] report_comment
    # See: https://yts.to/api#report_comment
    #
    # Report a comment on a movie
    #
    # @params
    #   user_key: String (required)
    #   comment_id: Integer (required)
    #   application_key: String (required)
    #
    # @returns Yify::Models::ApiResponse

    def report_comment(params)
      data = self.class.post("/report_comment", { body: post_params(params) })
      Yify::Response.new(data, :api_response)
    end

    # [POST] delete_comment
    # See: https://yts.to/api#delete_comment
    #
    # Delete a comment on a movie
    #
    # @params
    #   user_key: String (required)
    #   comment_id: Integer (required)
    #   application_key: String (required)
    #
    # @returns Yify::Models::ApiResponse

    def delete_comment(params)
      data = self.class.post("/delete_comment", { body: post_params(params) })
      Yify::Response.new(data, :api_response)
    end

    # [POST] make_request
    # See: https://yts.to/api#make_request
    #
    # Request a movie to be added to Yify.
    #
    # @params
    #   user_key: String (required)
    #   movie_title: String (required)
    #   application_key: String (required)
    #   request_message: String
    #
    # @returns Yify::Models::ApiResponse

    def make_request(params)
      data = self.class.post("/make_request", { body: post_params(params) })
      Yify::Response.new(data, :api_response)
    end

  end
end
