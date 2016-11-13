# Bnb Analyzer

## Requirements:

* Ruby 2.3.1
* Postgresql with PostGis extension

## Running this app (terminal commands):

* `$ gem install bundler` (if you don't have it already)
* `$ bundle install` (installing all required gems)
* `$ rake db:create` (creates the database)
* `$ rake db:migrate` (runs the migrations)
* `$ rails s` (starts the server)
* On your browser, navigate to localhost:3000

## Populating the database:

To populate AirBnb Data:
1. Go to the [AirBnb data page](insideairbnb.com/get-the-data.html)
2. Scroll down to New York City data, download `listings.csv.gz`
3. Extract the file on your computer
4. On the console, run `$ rake populate:airbnb[path/to/file]`

That last step should print the output when its done.

To populate NYC Open Data: 
(Coming soon)