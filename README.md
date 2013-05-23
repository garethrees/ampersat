# Calculate Most Common Domains From Email List

[![Build Status](https://secure.travis-ci.org/garethrees/ampersat.png)](http://travis-ci.org/garethrees/ampersat) [![Code Climate](https://codeclimate.com/github/garethrees/ampersat.png)](https://codeclimate.com/github/garethrees/ampersat)

It's worth checking what email clients your subscribers are using so that you can make sure your emails look good when they view them.

This gem looks at your subscribers CSV and lists the domains in order of popularity*.

* This obviously doesn't take desktop mail clients in to account, but it should give you an idea of what people are using.

## How to Use

### Install

		gem install ampersat

### In irb

		$ irb
		> require 'ampersat'
		    => true
		> Ampersat.domains("/path/to/csv")
		=> [["example.com", 2], ["example.org", 1], ["example.net", 1]]

### In Your App

		domains = Ampersat.domains("/Users/gareth/test.csv")

		domains.each do |domain, count|
			puts "#{domain}: #{count}"
		end

		# example.com: 2
		# example.org: 1
		# example.net: 1
