# simple-debug-for-rails
this is a gem for watching rails log conveniently.
When I'm developing with rails, I'd like to watch rails log to confirm is my data store to database right no not. But It's hard to find which line is insert/update/delete sql. So I build this gem to watch rails log conveniently.

## Usage:
Add this line to your application's Gemfile:

     gem 'simple_debug'
And then execute:

    $ bundle
you can see insert/update/delete sql is highlighted with red background now.


## Which feature I will do in the future?
1. display key and value in a table for validating data.
2. find which line fo code trigger insert/update/delete sql.

