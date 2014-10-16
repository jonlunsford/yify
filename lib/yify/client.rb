module Yify
  class Client
    include HTTParty
    base_uri 'http://yts.re/api'
    format :json

    def upcoming
      self.class.get("/upcoming")
    end

    def list(options)
      self.class.get("/list", { query: options })
    end

    def list_imdb(options)
      self.class.get("/listimdb", { query: options })
    end

    def movie(id)
      self.class.get("/movie", { query: { id: id } })
    end

    def comments(movie_id)
      self.class.get("/comments", { query: { movieid: movie_id } })
    end
  end
end
