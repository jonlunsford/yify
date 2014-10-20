# A ruby wrapper for the YIFY Torrents API (https://yts.re/api)

module Yify
  class Client
    include HTTParty
    base_uri 'http://yts.re/api'
    format :json

    # [GET] upcoming
    # See: https://yts.re/api#upcomingDocs
    #
    # A list of all upcoming movies.
    #
    # @returns [Yify::Models::UpcomingMovie]
    def upcoming
      data = self.class.get("/upcoming")
      Yify::Response.new(data, :upcoming_movie)
    end

    # [GET] list
    # See: https://yts.re/api#listDocs
    #
    # Get a list of movies, this method can be used to search
    # or filter.
    #
    # @returns [Yify::Models::Movie]
    def list(options)
      data = self.class.get("/list", { query: options })
      Yify::Response.new(data, :movie_list)
    end

    # [GET] list_imbd
    # See: https://yts.re/api#listimdbDocs
    #
    # Get a list of movies using a desired list of IMDB IDs.
    #
    # @returns [Yify::Models::Movie]
    def list_imdb(options)
      data = self.class.get("/listimdb", { query: options })
      Yify::Response.new(data, :movie_list)
    end

    # [GET] movie
    # See: https://yts.re/api#movieDocs
    #
    # Get movie details.
    #
    # @returns Yify::Models::Movie
    def movie(id)
      data = self.class.get("/movie", { query: { id: id } })
      Yify::Response.new(data, :movie)
    end

    # [GET] comments
    # See: https://yts.re/api#commentDocs
    #
    # Get comments for the desired movie
    #
    # @returns [Yify::Models::Comment]
    def comments(movie_id)
      data = self.class.get("/comments", { query: { movieid: movie_id } })
      Yify::Response.new(data, :comment)
    end

    # [POST] post_comment
    # See: https://yts.re/api#commentpostDocs
    #
    # Add comment to a movie.
    #
    # @returns Yify::Models::ApiResponse
    def post_comment(options)
      data = self.class.post("/commentpost", { body: options })
      Yify::Response.new(data, :api_response)
    end

    # [GET] user
    # See: https://yts.re/api#userDocs
    #
    # Get desired users' details.
    #
    # @returns Yify::Models::User
    def user(user_id)
      data = self.class.get("/user", { query: { id: user_id } })
      Yify::Response.new(data, :user)
    end

    # [POST] register
    # See: https://yts.re/api#registerDocs
    #
    # Register a new user with Yify.
    #
    # @returns Yify::Models::ApiResponse
    def register(options)
      data = self.class.post("/register", { body: options })
      Yify::Response.new(data, :api_response)
    end

    # [POST] login
    # See: https://yts.re/api#loginDocs
    #
    # Login a Yify user.
    #
    # @returns Yify::Models::Session
    def login(options)
      data = self.class.post("/login", { body: options })
      Yify::Response.new(data, :session)
    end

    # [POST] send_password_reset
    # https://yts.re/api#passRecoveryDoc
    #
    # Send a password reset email to the specified email address.
    #
    # @returns Yify::Models::ApiResponse
    def send_password_reset(email)
      data = self.class.post("/sendresetpass", { body: { email: email } })
      Yify::Response.new(data, :api_response)
    end

    # [POST] reset_password
    # See: https://yts.re/api#resetPasswordDocs
    #
    # Reset the users' password.
    def reset_password(options)
      data = self.class.post("/resetpassconfirm", { body: options })
      Yify::Response.new(data, :api_response)
    end

    # [GET] profile
    # See: https://yts.re/api#profileDocs
    #
    # Get a logged in users' profile.
    #
    # @returns Yify::Models::Profile
    def profile(hash)
      data = self.class.get("/profile", { query: { hash: hash } })
      Yify::Response.new(data, :profile)
    end

    # [POST] update_profile
    # See: https://yts.re/api#editProfileDocs
    #
    # update a logged in users' profile.
    #
    # @returns Yify::Models::ApiResponse
    def update_profile(options)
      data = self.class.post("/editprofile", { body: options })
      Yify::Response.new(data, :api_response)
    end

    # [GET] requests
    # See: https://yts.re/api#requestsDocs
    #
    # Get a list of all requested movies.
    #
    # @returns [Yify::Models::RequestedMovie]
    def requests(options)
      data = self.class.get("/requests", { query: options })
      Yify::Response.new(data, :request_list)
    end

    # [POST] make_request
    # See: https://yts.re/api#makerequestsDocs
    #
    # Request a movie to be added to Yify.
    #
    # @returns Yify::Models::ApiResponse
    def make_request(options)
      data = self.class.post("/makerequest", { body: options })
      Yify::Response.new(data, :api_response)
    end

    # [POST] vote
    # See: https://yts.re/api#voteDocs
    #
    # Vote for a requested movie.
    #
    # @returns Yify::Models::ApiResponse
    def vote(options)
      data = self.class.post("/vote", { body: options })
      Yify::Response.new(data, :api_response)
    end
  end
end
