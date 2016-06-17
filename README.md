# Skiddle

A gem for accessing the Skiddle API

## Installation

Add this line to your application's Gemfile:

    gem 'skiddle'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install skiddle

## Usage

Examples


## authentication

All requests require a valid API key. For a free api key please <a href='http://www.skiddle.com/api/join.php' data-target='self'>apply here</a>

```ruby

# set SKIDDLE_API_KEY as environment variable
export SKIDDLE_API_KEY=2a9b81935edf91e634f....

```

# skiddle events search api

```ruby
Skiddle::Event.search # => returns list of Event array object
```

# skiddle event search parameters

Geographical:

* latitude: (decimal, optional) - Specify a latitude to find nearby events (eg 53.000)
* longitude: (decimal, optional) - Specify a longitude to find nearby events (eg -1.234)
* radius: (decimal, optional) - Find events within the specified miles radius (eg 10)

```ruby
Skiddle::Event.search({latitude: 54.971839, longitude: -1.604113, radius: 2000}) # => returns list of Event array object
```

To use geo searching, all 3 of the above parameters must be specified.

* eventcode: (string, optional) - Filter by type of event. Note the category is selected by the event promoter when submitting the event so can be subjective! Choose from:

	- FEST = Festivals
	- LIVE = Live music
	- CLUB = Clubbing/Dance music
	- DATE = Dating event
	- THEATRE = Theatre/Dance
	- COMEDY = Comedy
	- EXHIB = Exhibitions and Attractions
	- KIDS = Kids/Family Event
	- BARPUB = Bar/Pub event
	- LGB = Gay/Lesbian event
	- SPORT = Sporting event
	- ARTS = The Arts

```ruby
Skiddle::Event.search({eventcode: 'LIVE'}) # => returns list of Event array object
```

* minDate: (string,optional) - Find events on or after this date. Format as YYYY-MM-DD
* maxDate: (string,optional) - Find events before or on this date. Format as YYYY-MM-DD

```ruby
Skiddle::Event.search({minDate: '2016-06-17', maxDate: '2016-06-30'})
```

* venueid: (integer,optional) - Find events at a particular venue. See the venues search for details (as an integer)

```ruby
Skiddle::Event.search({venueid: 30720})
```

* b: (integer,optional) - Find events attached to a particular brandID (eg Ministry of Sound). See the brands search for details

```ruby
Skiddle::Event.search({b: 123123})
```
* a: (integer,optional) - Find events that a particular artistID is tagged to (eg Riva Starr). See the artsits search for details

```ruby
Skiddle::Event.search({a: 123123})
```

* order: (integer,optional) - Specify sort order. Chose from:

	- 0: (default) Date, featured, eventname
	- 12: Date order, then eventname
	- 2: Event Name then Date
	- 3: Venue Name, then Event Name, then Date
	- 4: Popularity (most popular first)
	- 5: Best rated venues first

* limit: (Integer, optional) - Specify number of records returned (max 100, default 20)

* offset: (Integer, optional) - Specify record number to start at (for paging, in conjunction with limit, order) (default 0)

```ruby
Skiddle::Event.search({limit: 100, offset: 201})
```

# skiddle venues search api

```ruby
Skiddle::Venue.search # => returns list of Venue array object
```

# skiddle venue search parameters

Geographical:

* latitude: (decimal, optional) - Specify a latitude to find nearby events (eg 53.000)
* longitude: (decimal, optional) - Specify a longitude to find nearby events (eg -1.234)
* radius: (decimal, optional) - Find events within the specified miles radius (eg 10)

To use geo searching, all 3 of the above parameters must be specified.

* type: (string,optional) - Type of venue. Chose from:

	- b = Bar/Pub
	- n = Nightclub
	- l = Live Music
	- o = Outdoor venue
	- t = Theatre
	- s = Sports ground

```ruby
Skiddle::Venue.search({latitude: 54.971839, longitude: -1.604113, radius: 2000, type: 'b'}) # => returns list of Venue array object
```

* limit: (Integer, optional) Specify number of records returned (max 100, default 20)

* offset: (Integer, optional) Specify record number to start at (for paging, in conjunction with limit, order) (default 0)

```ruby
Skiddle::Venue.search({limit: 100, offset: 201}) # => returns list of Venue array object
```

# skiddle artists search api

```ruby
Skiddle::Artist.search # => returns list of Artist array object
```

# skiddle artist search parameters

* name: (string,optional) - Name of artist to search for

* venueid: (integer,optional) - Find artists playing at a particular venue. See the venues search for details (as an integer)

* b: (integer,optional) - Find artists playing for a particular brandID (eg Ministry of Sound). See the brands search for details

```ruby
Skiddle::Artist.search({name: 'Alkaline', venueid: 11398}) # => returns list of Artist array object
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Let’s build something great:

We’d love to design & build your next big idea, or lend a hand on an existing project.

	Email - contact@7precisions.com
	Website - http://7precisions.com
	
![alt tag](https://www.google.com/a/cpanel/7precisions.com/images/logo.gif?alpha=1&service=google_default)