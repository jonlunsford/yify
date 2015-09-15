# A ruby wrapper for the YIFY Torrents API (https://yts.to/api)

module Yify
  class Client
    include HTTParty
    base_uri 'http://yts.to/api/v2'
    format :json

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

    # [POST] post_comment
    # See: https://yts.to/api#commentpostDocs
    #
    # Add comment to a movie.
    #
    # @returns Yify::Models::ApiResponse

    def post_comment(params)
      data = self.class.post("/commentpost", { body: params })
      Yify::Response.new(data, :api_response)
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

    # [POST] register
    # See: https://yts.to/api#registerDocs
    #
    # Register a new user with Yify.
    #
    # @returns Yify::Models::ApiResponse
    def register(params)
      data = self.class.post("/register", { body: params })
      Yify::Response.new(data, :api_response)
    end

    # [POST] login
    # See: https://yts.to/api#loginDocs
    #
    # Login a Yify user.
    #
    # @returns Yify::Models::Session
    def login(params)
      data = self.class.post("/login", { body: params })
      Yify::Response.new(data, :session)
    end

    # [POST] send_password_reset
    # https://yts.to/api#passRecoveryDoc
    #
    # Send a password reset email to the specified email address.
    #
    # @returns Yify::Models::ApiResponse
    def send_password_reset(email)
      data = self.class.post("/sendresetpass", { body: { email: email } })
      Yify::Response.new(data, :api_response)
    end

    # [POST] reset_password
    # See: https://yts.to/api#resetPasswordDocs
    #
    # Reset the users' password.
    def reset_password(params)
      data = self.class.post("/resetpassconfirm", { body: params })
      Yify::Response.new(data, :api_response)
    end

    # [GET] profile
    # See: https://yts.to/api#profileDocs
    #
    # Get a logged in users' profile.
    #
    # @returns Yify::Models::Profile
    def profile(hash)
      data = self.class.get("/profile", { query: { hash: hash } })
      Yify::Response.new(data, :profile)
    end

    # [POST] update_profile
    # See: https://yts.to/api#editProfileDocs
    #
    # update a logged in users' profile.
    #
    # @returns Yify::Models::ApiResponse
    def update_profile(params)
      data = self.class.post("/editprofile", { body: params })
      Yify::Response.new(data, :api_response)
    end

    # [GET] requests
    # See: https://yts.to/api#requestsDocs
    #
    # Get a list of all requested movies.
    #
    # @returns [Yify::Models::RequestedMovie]
    def requests(params)
      data = self.class.get("/requests", { query: params })
      Yify::Response.new(data, :request_list)
    end

    # [POST] make_request
    # See: https://yts.to/api#makerequestsDocs
    #
    # Request a movie to be added to Yify.
    #
    # @returns Yify::Models::ApiResponse
    def make_request(params)
      data = self.class.post("/makerequest", { body: params })
      Yify::Response.new(data, :api_response)
    end

    # [POST] vote
    # See: https://yts.to/api#voteDocs
    #
    # Vote for a requested movie.
    #
    # @returns Yify::Models::ApiResponse
    def vote(params)
      data = self.class.post("/vote", { body: params })
      Yify::Response.new(data, :api_response)
    end
  end
end
