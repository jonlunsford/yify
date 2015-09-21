# Yify

[![Gem Version](https://badge.fury.io/rb/yify.svg)](http://badge.fury.io/rb/yify)

A Ruby wrapper for the [Yify Torrents API](https://yts.to/api)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'yify'
```
And then execute:

```ruby
$ bundle
```
Or install it yourself as:

```ruby
$ gem install yify
```

## Usage

Require Yify in your project:

```ruby
require 'yify'
```

##### Configuration

If you plan on making POST requests you must provide an `application_key` by
requesting one [here](https://yts.to/contact). Please note that the email from
Yify will be in your spam folder 99.9% of the time, so check there :)

You can configure your Yify client by passing in your `application_key` directly,
like so:

```ruby
client = Yify::Client.new("1235dsfjkdladfs")
client.application_key
=> "1235dsfjkdladfs"
```

Alternatively you can set a `yify_application_key` environment variable and that
will be picked up automatically:

```ruby
ENV["yify_application_key"] = "1235dsfjkdladfs"

client = Yify::Client.new
client.application_key
=> "1235dsfjkdladfs"
```

Now you can make POST requests and the `application_key` will be set for you,
no need to pass it as a param every time:

```ruby
client.user_get_key({ username: "hello", password: "world" })

=> #<Yify::Response:0x007f90f512f010
 @model=:session,
 @response=
  {"status"=>"ok",
   "status_message"=>"User successfully logged in",
   "data"=>
    {"user_id"=>123456,
     "username"=>"hello",
     "email"=>"hello@world.com",
     "user_key"=>"12345678910abcdefghij"},
   "@meta"=>
    {"server_time"=>1442866362,
     "server_timezone"=>"Pacific/Auckland",
     "api_version"=>2,
     "execution_time"=>"5.02 ms"}},
 @result=
  #<Yify::Models::Session:0x007f90f512dd78
   @attribute_set=#<Virtus::AttributeSet:0x007f90f5132b20>,
   @email="hello@world.com",
   @user_id=123456,
   @user_key="12345678910abcdefghij", # You will need this to make requests on behalf of the user
   @username="hello">>
```

##### Example Response

This gem translates the raw JSON coming back from Yify into full fledged Ruby objects, like this:

```ruby
client = Yify::Client.new
client.list_upcoming
client.result

=> [#<Yify::Models::Movie:0x007f88675d27c0
    @attribute_set=#<Virtus::AttributeSet:0x007f88675cb560>,
    @date_added="2015-09-22 08:32:41",
    @date_added_unix=1442867561,
    @imdb_code="tt2582496",
    @medium_cover_image=
     "http://s.ynet.io/assets/images/upcoming/14428675626.jpg",
    @title="Me and Earl and the Dying Girl",
    @year=2015>,
   #<Yify::Models::Movie:0x007f88675b9f40
    @attribute_set=#<Virtus::AttributeSet:0x007f8867582888>,
    @date_added="2015-09-19 04:18:56",
    @date_added_unix=1442593136,
    @imdb_code="tt0096926",
    @medium_cover_image=
     "http://s.ynet.io/assets/images/upcoming/144259313649.jpg",
    @title="The Big Picture",
    @year=1989>,
   #<Yify::Models::Movie:0x007f8867578608
      ...
   ]>
```

A `Yify::Response` will always return an untouched hash as well, like this:

```ruby
client = Yify::Client.new
client.list_upcoming
client.response

=> {"status"=>"ok",
   "status_message"=>"Query was successful",
   "data"=>
    {"upcoming_movies_count"=>4,
     "upcoming_movies"=>
      [{"title"=>"Me and Earl and the Dying Girl",
        "year"=>2015,
        "imdb_code"=>"tt2582496",
        "medium_cover_image"=>
         "http://s.ynet.io/assets/images/upcoming/14428675626.jpg",
        "date_added"=>"2015-09-22 08:32:41",
        "date_added_unix"=>1442867561},
       {"title"=>"The Big Picture",
        "year"=>1989,
        "imdb_code"=>"tt0096926",
        "medium_cover_image"=>
         "http://s.ynet.io/assets/images/upcoming/144259313649.jpg",
        "date_added"=>"2015-09-19 04:18:56",
        "date_added_unix"=>1442593136}
        ...
        ]},
   "@meta"=>
    {"server_time"=>1442868382,
     "server_timezone"=>"Pacific/Auckland",
     "api_version"=>2,
     "execution_time"=>"1.62 ms"}},
```

## API Documentation

You can view the full YTS API documentation [here](https://yts.to/api). Every
request documented is implemented by this gem, please file an issue if you find
a request that is not implemented.

## Testing

This gem uses [dotenv](https://github.com/bkeepers/dotenv) to manage necessary
environment variables. After cloning this repo you will need to set the
following in a `.env` file in the root directory of this gem:

```ruby
yify_application_key=1234567890asdfg
user_key=1234567890asdfg
username=hello_world
username_variant=hello-world
password=pass1234
new_password=pass1234
email=hello@world.com
user_id=1234567,
ip_address=1.2.3.4.5
reset_code=fdase123
```

The values don't matter, this is just so vcr has something to reference when
filtering out sensitive data from the cassettes.

## Change Log

- **0.0.4:** Add application_key configuration
- **0.0.3:** Implement YTS API V2
- **0.0.2:** Update base_uri from yts.re -> yts.to
- **0.0.1:** Initial release

## Contributing

1. Fork it ( https://github.com/jonlunsford/yify/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
