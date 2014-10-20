module Yify
  class Client
    include HTTParty
    base_uri 'http://yts.re/api'
    format :json

    def upcoming
      data = self.class.get("/upcoming")
      Yify::Response.new(data, :upcoming_movie)
    end

    def list(options)
      data = self.class.get("/list", { query: options })
      Yify::Response.new(data, :movie_list)
    end

    def list_imdb(options)
      data = self.class.get("/listimdb", { query: options })
      Yify::Response.new(data, :movie_list)
    end

    def movie(id)
      data = self.class.get("/movie", { query: { id: id } })
      Yify::Response.new(data, :movie)
    end

    def comments(movie_id)
      data = self.class.get("/comments", { query: { movieid: movie_id } })
      Yify::Response.new(data, :comment)
    end

    def post_comment(options)
      data = self.class.post("/commentpost", { body: options })
      Yify::Response.new(data, :api_response)
    end

    def user(user_id)
      data = self.class.get("/user", { query: { id: user_id } })
      Yify::Response.new(data, :user)
    end

    def register(options)
      data = self.class.post("/register", { body: options })
      Yify::Response.new(data, :api_response)
    end

    def login(options)
      data = self.class.post("/login", { body: options })
      Yify::Response.new(data, :session)
    end

    def send_password_reset(email)
      data = self.class.post("/sendresetpass", { body: { email: email } })
      Yify::Response.new(data, :api_response)
    end

    def reset_password(options)
      data = self.class.post("/resetpassconfirm", { body: options })
      Yify::Response.new(data, :api_response)
    end

    def profile(hash)
      data = self.class.get("/profile", { query: { hash: hash } })
      Yify::Response.new(data, :profile)
    end

    def update_profile(options)
      data = self.class.post("/editprofile", { body: options })
      Yify::Response.new(data, :api_response)
    end

    def requests(options)
      data = self.class.get("/requests", { query: options })
      Yify::Response.new(data, :request_list)
    end

    def make_request(options)
      data = self.class.post("/makerequest", { body: options })
      Yify::Response.new(data, :api_response)
    end

    def vote(options)
      data = self.class.post("/vote", { body: options })
      Yify::Response.new(data, :api_response)
    end
  end
end
