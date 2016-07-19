# A ruby wrapper for the YIFY Torrents API (https://yts.ag/api)

module Yify
  class Client
    include Yify::Support::Utils
    include HTTParty

    attr_accessor :application_key

    base_uri 'https://yts.ag/api/v2'
    format :json

    def initialize(application_key = nil)
      @application_key = application_key || ENV["yify_application_key"]
    end

    # [GET] list_movies
    # See: https://yts.ag/api#list_movies
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
      data = self.class.get("/list_movies.json", { query: params })
      Yify::Response.new(data, :movies)
    end

    # [GET] movie_details
    # See: https://yts.ag/api#movie_details
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
      data = self.class.get("/movie_details.json", { query: params })
      Yify::Response.new(data, :movie)
    end

    # [GET] movie_suggestions
    # See: https://yts.ag/api#movie_suggestions
    #
    # Returns 4 related movies as suggestions for the user
    #
    # @params
    #   movie_id: Integer (required)
    #
    # @returns [Yify::Models::Movie]

    def movie_suggestions(movie_id)
      data = self.class.get("/movie_suggestions.json", { query: { movie_id: movie_id } })
      Yify::Response.new(data, :movies)
    end

    # [GET] movie_comments
    # See: https://yts.ag/api#movie_comments
    #
    # Get comments for the desired movie
    #
    # @params
    #   movie_id: Integer (required)
    #
    # @returns [Yify::Models::Comment]
    #
    # ENDPONT NO LONGER WORKS

    def movie_comments(movie_id)
      #data = self.class.get("/movie_comments.json", { query: { movie_id: movie_id } })
      #Yify::Response.new(data, :comments)

      nil
    end

    # [GET] movie_reviews
    # See: https://yts.ag/api#movie_reviews
    #
    # Get reviews for the desired movie
    #
    # @params
    #   movie_id: Integer (required)
    #
    # @returns [Yify::Models::Review]
    #
    # ENDPONT NO LONGER WORKS

    def movie_reviews(movie_id)
      #data = self.class.get("/movie_reviews", { query: { movie_id: movie_id } })
      #Yify::Response.new(data, :reviews)

      nil
    end

    # [GET] movie_parental_guides
    # See: https://yts.ag/api#movie_parental_guides
    #
    # Get parental guides for the desired movie
    #
    # @params
    #   movie_id: Integer (required)
    #
    # @returns [Yify::Models::ParentalGuide]
    #
    # ENDPONT NO LONGER WORKS

    def movie_parental_guides(movie_id)
      #data = self.class.get("/movie_parental_guides", { query: { movie_id: movie_id } })
      #Yify::Response.new(data, :parental_guides)

      nil
    end

    # [GET] list_upcoming
    # See: https://yts.ag/api#list_upcoming
    #
    # A list of all upcoming movies.
    #
    # @returns [Yify::Models::UpcomingMovie]
    #
    # ENDPONT NO LONGER WORKS

    def list_upcoming
      #data = self.class.get("/list_upcoming")
      #Yify::Response.new(data, :upcoming_movies)

      nil
    end

    # [GET] user_details
    # See: https://yts.ag/api#user_details
    #
    # Get desired users' details.
    #
    # @params
    #   user_id: Integer (required)
    #   with_recently_downloaded: Boolean
    #
    # @returns Yify::Models::User
    #
    # ENDPONT NO LONGER WORKS

    def user_details(params)
      #data = self.class.get("/user_details", { query: params })
      #Yify::Response.new(data, :user)

      nil
    end

    # [POST] get_user_key
    # See: https://yts.ag/api#get_user_key
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
    #
    # ENDPONT NO LONGER WORKS

    def user_get_key(params)
      #data = self.class.post("/user_get_key", { body: post_params(params) })
      #Yify::Response.new(data, :session)

      nil
    end

    # [GET] user_profile
    # See: https://yts.ag/api#user_profile
    #
    # Get a logged in user's profile.
    #
    # @params
    #   user_key: String (required) response from user_get_key
    #
    # @returns Yify::Models::User
    #
    # ENDPONT NO LONGER WORKS

    def user_profile(user_key)
      #data = self.class.get("/user_profile", { query: { user_key: user_key } })
      #Yify::Response.new(data, :user)

      nil
    end

    # [POST] user_edit_settings
    # See: https://yts.ag/api#user_edit_settings
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
    #
    # ENDPONT NO LONGER WORKS

    def user_edit_settings(params)
      #data = self.class.post("/user_edit_settings", { body: post_params(params) })
      #Yify::Response.new(data, :user)

      nil
    end

    # [POST] user_register
    # See: https://yts.ag/api#user_register
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
    #
    # ENDPONT NO LONGER WORKS

    def user_register(params)
      #data = self.class.post("/user_register", { body: post_params(params) })
      #Yify::Response.new(data, :session)

      nil
    end

    # [POST] user_forgot_password
    # https://yts.ag/api#user_forgot_password
    #
    # Send a password reset email to the specified email address.
    #
    # @params
    #   email: String (required)
    #   application_key: String (required)
    #
    # @returns Yify::Models::ApiResponse
    #
    # ENDPONT NO LONGER WORKS

    def user_forgot_password(params)
      #data = self.class.post("/user_forgot_password", { body: post_params(params) })
      #Yify::Response.new(data, :api_response)

      nil
    end

    # [POST] user_reset_password
    # See: https://yts.ag/api#user_reset_password
    #
    # Reset the users' password.
    #
    # @params
    #   reset_code: String (required)
    #   new_password: String (required)
    #   application_key: String (required)
    #
    # @returns Yify::Models::Session
    #
    # ENDPONT NO LONGER WORKS

    def user_reset_password(params)
      #data = self.class.post("/user_reset_password", { body: post_params(params) })
      #Yify::Response.new(data, :session)

      nil
    end

    # [POST] like_movie
    # See: https://yts.ag/api#like_movie
    #
    # Reset the users' password.
    #
    # @params
    #   user_key: String (required)
    #   movie_id: Integer (required)
    #   application_key: String (required)
    #
    # @returns Yify::Models::ApiResponse
    #
    # ENDPONT NO LONGER WORKS

    def like_movie(params)
      #data = self.class.post("/like_movie", { body: post_params(params) })
      #Yify::Response.new(data, :api_response)

      nil
    end

    # [GET] get_movie_bookmarks
    # See: https://yts.ag/api#get_movie_bookmarks
    #
    # Get all the current movies which have been bookmarked for a given user
    #
    # @params
    #   user_key: String (required)
    #   with_rt_rattings: Boolean
    #
    # @returns [Yify::Models::Bookmark]
    #
    # ENDPONT NO LONGER WORKS

    def get_movie_bookmarks(params)
      #data = self.class.get("/get_movie_bookmarks", { query: params })
      #Yify::Response.new(data, :bookmarks)

      nil
    end

    # [POST] add_movie_bookmark
    # See: https://yts.ag/api#add_movie_bookmark
    #
    # Get all the current movies which have been bookmarked for a given user
    #
    # @params
    #   user_key: String (required)
    #   movie_id: Integer (required)
    #   application_key: String (required)
    #
    # @returns Yify::Models::Bookmark
    #
    # ENDPONT NO LONGER WORKS

    def add_movie_bookmark(params)
      #data = self.class.post("/add_movie_bookmark", { body: post_params(params) })
      #Yify::Response.new(data, :bookmark)

      nil
    end

    # [POST] delete_movie_bookmark
    # See: https://yts.ag/api#delete_movie_bookmark
    #
    # remove movies from the user's bookmarks
    #
    # @params
    #   user_key: String (required)
    #   movie_id: Integer (required)
    #   application_key: String (required)
    #
    # @returns Yify::Models::Bookmark
    #
    # ENDPONT NO LONGER WORKS

    def delete_movie_bookmark(params)
      #data = self.class.post("/delete_movie_bookmark", { body: post_params(params) })
      #Yify::Response.new(data, :api_response)

      nil
    end

    # [POST] make_comment
    # See: https://yts.ag/api#make_comment
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
    #
    # ENDPONT NO LONGER WORKS

    def make_comment(params)
      #data = self.class.post("/make_comment", { body: post_params(params) })
      #Yify::Response.new(data, :api_response)

      nil
    end

    # [POST] like_comment
    # See: https://yts.ag/api#like_comment
    #
    # Like a comment on a movie
    #
    # @params
    #   user_key: String (required)
    #   comment_id: Integer (required)
    #   application_key: String (required)
    #
    # @returns Yify::Models::ApiResponse
    #
    # ENDPONT NO LONGER WORKS

    def like_comment(params)
      #data = self.class.post("/like_comment", { body: post_params(params) })
      #Yify::Response.new(data, :api_response)

      nil
    end

    # [POST] report_comment
    # See: https://yts.ag/api#report_comment
    #
    # Report a comment on a movie
    #
    # @params
    #   user_key: String (required)
    #   comment_id: Integer (required)
    #   application_key: String (required)
    #
    # @returns Yify::Models::ApiResponse
    #
    # ENDPONT NO LONGER WORKS

    def report_comment(params)
      #data = self.class.post("/report_comment", { body: post_params(params) })
      #Yify::Response.new(data, :api_response)

      nil
    end

    # [POST] delete_comment
    # See: https://yts.ag/api#delete_comment
    #
    # Delete a comment on a movie
    #
    # @params
    #   user_key: String (required)
    #   comment_id: Integer (required)
    #   application_key: String (required)
    #
    # @returns Yify::Models::ApiResponse
    #
    # ENDPONT NO LONGER WORKS

    def delete_comment(params)
      #data = self.class.post("/delete_comment", { body: post_params(params) })
      #Yify::Response.new(data, :api_response)

      nil
    end

    # [POST] make_request
    # See: https://yts.ag/api#make_request
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
    #
    # ENDPONT NO LONGER WORKS

    def make_request(params)
      #data = self.class.post("/make_request", { body: post_params(params) })
      #Yify::Response.new(data, :api_response)

      nil
    end

  end
end
