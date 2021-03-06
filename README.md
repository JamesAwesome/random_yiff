[![Build Status](https://travis-ci.org/JamesAwesome/random_yiff.svg?branch=master)](https://travis-ci.org/JamesAwesome/random_yiff)
[![Coverage Status](https://coveralls.io/repos/JamesAwesome/random_yiff/badge.svg)](https://coveralls.io/r/JamesAwesome/random_yiff)
[![Gem Version](https://badge.fury.io/rb/random_yiff.svg)](http://badge.fury.io/rb/random_yiff)
[![Code Climate](https://codeclimate.com/github/JamesAwesome/random_yiff/badges/gpa.svg)](https://codeclimate.com/github/JamesAwesome/random_yiff)
# RandomYiff

RandomYiff will provide you with a random post from e621.net via their /post/random route.

The RandomYiff gem is both a library and a CLI app named `yiff`.

The `RandomYiff::E621` class allows a user to get a random post from e621. Helper methods such
as `#file` allow the user to access the furry pr0n associated with said e621 post with ease.

The `yiff` command allows users to open furry pr0n in browser or download furry pr0n to disk.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'random_yiff'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install random_yiff

## Usage

For CLI app usage

```bash
yiff help
```

To return a random post URI

```ruby
RandomYiff::E621.post_uri
```

Return the original post from e621.net

```ruby
yiff = RandomYiff::E621.new
yiff.post
```

Get a URI object for the post's file_url

```ruby
yiff = RandomYiff::E621.new
yiff.file_uri
```

Download the file from the posts file_url

```ruby
yiff = RandomYiff::E621.new
yiff.file
```

Instance methods are available via method_missing for all post parameters

```ruby
yiff = RandomYiff::E621.new
yiff.file_url #=> "https://e621.net/foo/bar"
yiff.md5      #=> "b95477fdff6cb77ade50c7e0389c84a0"
yiff.source   #=> "http://www.deviantart.com/foo/bar"
```

If provided a block yields self

```ruby
RandomYiff::E621.new do |yiff|
  File.open("#{yiff.md5}.#{yiff.file_ext}", 'w') do |f|
    f.write yiff.file
  end
end
```

## Testing
```ruby
bundle install

rake
```

## Contributing

1. Fork it ( https://github.com/jamesawesome/random_yiff/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
