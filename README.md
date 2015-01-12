# KinesisCat

[Amazon Kinesis](http://aws.amazon.com/kinesis/) cli for put JSON data.

[![Gem Version](https://badge.fury.io/rb/kinesis_cat.svg)](http://badge.fury.io/rb/kinesis_cat)
[![Build Status](https://travis-ci.org/winebarrel/kinesis_cat.svg?branch=master)](https://travis-ci.org/winebarrel/kinesis_cat)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'kinesis_cat'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install kinesis_cat

## Usage

```sh
cat '{"key": "val"}' | kinesis-cat --stream-name my-stream
```

## Help

```
Usage: kinesis-cat [options]
    -p, --profile PROFILE_NAME
        --credentials-path PATH
    -k, --access-key ACCESS_KEY
    -s, --secret-key SECRET_KEY
    -r, --region REGION
        --stream-name NAME
        --partition-key KEY
        --debug
```
