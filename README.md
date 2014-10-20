# Yify

[![Gem Version](https://badge.fury.io/rb/yify.svg)](http://badge.fury.io/rb/yify)

A Ruby wrapper for the [Yify torrenst API](http://yify-torrents.com/api/)

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
	
	movie = client.movie(353).result
	=> #<Yify::Models::Movie:0x007f9b14360130>
	
	movie.movie_title
	=> "We Were Soldiers (2002)"
	
A `Yify::Response` will always return an untouched hash as well, like this:
	
	movie = client.movie(353).response
	=> {"MovieID"=>"353",
 		"MovieUrl"=>"http://yts.re/movie/We_Were_Soldiers_2002",
 		"DateUploaded"=>"2011-08-31 01:04:02",
 		... }
	
	movie["MovieID"]
	=> "353"

#### Upcoming Movies, [yify docs](http://yify-torrents.com/api/#upcomingDocs)

Get a list of all upcoming movies.
	
	client = Yify::Client.new
	movies = client.upcoming.result

#### List Movies, [yify docs](http://yify-torrents.com/api/#listDocs)

Get a list of movies, this can also be used to search or filter all movies on Yify.

	params = { limit: 50, quality: 720 }
	client = Yify::Client.new
	movies = client.list(params).result
	
Available request parameters:

Parameter |required | Default | Description
----------|---------|---------|----
`limit`   | **no**  |20       |Determines the max amount of movie results
`set`     | **no**  |1        |Used to see the next set of movies, eg limit=15 and set=2 will show you movies 15-30
`quality` | **no**  |ALL      |Ability to select a quality type to filter by
`rating`  | **no**  |0        |Sets minimum movie rating for display
`keywords`| **no**  |         |Matching keywords title search, IMDB code, Actor Name/IMDB code or Director Name/IMDB code
`genre`   | **no**  | ALL     |Display movies from chosen type genre
`sort`    | **no**  | date    |Sorts the results by choose method
`order`   | **no**  | desc    |Orders the results with either ascending or descending

#### List Movies By IMDB ID, [yify docs](http://yify-torrents.com/api/#listimdbDocs)

Get a list of movies based on IMDB IDs.

	params = { imdb_id: ["tt0111161", "tt0068646"] }
	client = Yify::Client.new
	movies = client.list_imdb(params).result
	
Available request parameters:

Parameter |required  | Default | Description
----------|----------|---------|----
`imdb_id` | **yes**  |         |he input IMDB IDs to retrieve the movies for

#### Movie Details, [yify docs](http://yify-torrents.com/api/#movieDocs)

Get an individual movie.

	client = Yify::Client.new
	movie = client.movie(353).result
	
Available request parameters:

Parameter |required  | Default | Description
----------|----------|---------|----
`id`      | **yes**  |         |View full details of specified MovieID

#### Movie Comments, [yify docs](http://yify-torrents.com/api/#commentDocs)

Get all comments related to a movie.

	client = Yify::Client.new
	comments = client.comments(353).results

Available request parameters:

Parameter |required  | Default | Description
----------|----------|---------|----
`movieid` | **yes**  |         |View full list of comments for specified film

#### User Details, [yify docs](http://yify-torrents.com/api/#userDocs)

Get details for specified user.

	client = Yify::Client.new
	user = client.user(16).results

Available request parameters:

Parameter |required  | Default | Description
----------|----------|---------|----
`id`      | **yes**  |         |The unique userID that we want to see the info for

#### Registration, [yify docs](http://yify-torrents.com/api/#registerDocs)

Register a new user. Upon successful registration a confirmation email will be sent.

    params = { username: "my_user", password: "test1234", email: "me@me.com" }
    client = Yify::Client.new
    client.register(params)

Available request parameters:

Parameter |required  | Description
----------|----------|-------------
`username`| **yes**  |The username of the desired account
`password`| **yes**  |The username of the desired account
`email`   | **yes**  |The email address for verification

#### Password Recovery, [yify docs](http://yify-torrents.com/api/#passRecoveryDoc)

Ask Yify for a password recovery email.

	client = Yify::Client.new
	client.send_password_reset("me@me.com")
	
Available request parameters:

Parameter |required  | Description
----------|----------|-------------
`email`   | **yes**  |The email address that was registered with the account to send recovery code to

#### Resetting Password, [yify docs](http://yify-torrents.com/api/#resetPasswordDocs)

Send the new password to Yify.
	
	params = { code: "xxxxxxxxxx", newpassword: "MyPassword" }
	client = Yify::Client.new
	client.reset_password(params)
	
Available request parameters:

Parameter    |required  | Description
-------------|----------|-------------
`code`       | **yes**  |The password reset code from email
`newpassword`| **yes**  |The new desired password for the account

#### Login, [yify docs](http://yify-torrents.com/api/#loginDocs)

Login a user.

	params = { username: "username", password: "password" }
	client = Yify::Client.new
	client.login(params)

The result of this call will be a Yify::Models::Session object that will store the returned user hash from Yify.

Available request parameters:

Parameter |required  | Description
----------|----------|-------------
`username`| **yes**  |The username of the desired account
`password`| **yes**  |The username of the desired account

#### Profile, [yify docs](https://yts.re/api#profileDocs)

Get details about a users' profile.

	client = Yify::Client.new
	profile = client.profile(hash_returned_from_the_login_call)
	
Available request parameters:

Parameter |required  | Description
----------|----------|-------------
`hash`    | **yes**  |The unique hash that will be used as a means of authentication

#### Edit Profile, [yify docs](https://yts.re/api#editProfileDocs)

Edit a users' profile.

    params = { hash: hash_returned_from_the_login_call, about: "RUBY FTW!" }
    client = Yify::Client.new
    client.update_profile(params)
    
Available request parameters:

Parameter     |required  | Description
--------------|----------|-------------
`hash`        | **yes**  |The unique hash that will be used as a means of authentication
`active`      | **no**   |By default all profiles are showing and active(1), 0 will make them hidden
`about`       | **no**   |Text describing the user in a short paragraph
`new password` | **no**   |The new desired password (required 'oldpassword' for confirmation)
`old password` | **no**   |The old password as confirmation
`avatar`      | **no**   |This will be the newest avatar image for the user

#### Requests, [yify docs](https://yts.re/api#requestsDocs)

Get a list of all currently requested movies.

    params = { page: "confirmed", limit: 2 }
    client = Yifi::Client.new
    requests = client.requests(params)
    
    
Available request parameters:

Parameter     |required  | Description
--------------|----------|-------------
`page`        | **yes**  |'accepted' or 'confirmed'. Gives the choice to view the currently open movies for voting and the confirmed movies to be done
`limit`       | **no**   |Determines the max amount of request results
`set`         | **no**   |set to see the next set of movies, eg limit=15 and set=2 will show you movies 15-30
`sort`        | **no**   |Sorts the results by choose method
`order`       | **no**   |Orders the results with either ascending or descending

#### Make Request, [yify docs](https://yts.re/api#makerequestsDocs)

Send a movie request to Yify.
	
    params = { hash: hash_returned_from_the_login_call, request: "tt0111161" }
    client - Yify::Client.new
    client.make_request(params)
    
Available request parameters:

Parameter     |required  | Description
--------------|----------|-------------
`hash`        | **yes**  |The unique hash that will be used as a means of authentication
`request`     | **yes**  |Request input can be: Movie name or IMDB Code or IMDB URL

#### Vote, [yify docs](https://yts.re/api#voteDocs)

Vote for a requested movie.

    params = { hash: hash_returned_from_the_login_call, requestid: 1169 }
    client = Yify::Client.new
    client.vote(params)
    
Available request parameters:

Parameter     |required  | Description
--------------|----------|-------------
`hash`        | **yes**  |The unique hash that will be used as a means of authentication
`requested`   | **yes**  |The request ID you wish to vote on

## Contributing

1. Fork it ( https://github.com/jonlunsford/yify/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
