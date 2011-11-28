# encoding: utf-8
path = File.expand_path(File.dirname(__FILE__) + "/../lib/")
$LOAD_PATH.unshift(path) unless $LOAD_PATH.include?(path)
require "ampersat"


describe Ampersat do

  let(:email) { "test@example.com" }
  let(:multiple_emails) { "jim@example.com, bob@example.org, james@example.net" }

end