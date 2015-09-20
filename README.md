# Yify

[![Gem Version](https://badge.fury.io/rb/yify.svg)](http://badge.fury.io/rb/yify)

A Ruby wrapper for the [Yify Torrents API](https://yts.to/api)

## Installation

Add this line to your application's Gemfile:

    gem 'yify'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install yify

## Usage

Require Yify in your project:

	require 'yify'

This gem translates the raw JSON coming back from Yify into full fledged Ruby objects. This means you can access properties like this:

	client = Yify::Client.new
	=> #<Yify::Client:0x007f9b14321ef8>

	movie = client.movie_details(353).result
	=> #<Yify::Models::Movie:0x007f9b14360130>

	movie.movie_title
	=> "We Were Soldiers (2002)"

A `Yify::Response` will always return an untouched hash as well, like this:

	movie = client.movie_details(353).response
	=> {"id"=>"353",
 		"DateUploaded"=>"2011-08-31 01:04:02",
 		... }

	movie["id"]
	=> "353"

Note about POST request. You will have to provide your own `application_key` per
POST request. You can request an `application_key` [here](https://yts.to/contact).


#### API Documentation

You can view the full YTS API documentation [here](https://yts.to/api). Every
request documented is implemented by this gem, please file an issue if you find
a request that is not implemented.

## Change Log

- **0.0.3:** Implement YTS API V2
- **0.0.2:** Update base_uri from yts.re -> yts.to
- **0.0.1:** Initial release

## Contributing

1. Fork it ( https://github.com/jonlunsford/yify/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
