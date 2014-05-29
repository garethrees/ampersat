# encoding: utf-8
path = File.expand_path(File.dirname(__FILE__) + '/../lib/')
$LOAD_PATH.unshift(path) unless $LOAD_PATH.include?(path)
require 'ampersat'

describe Ampersat do

  let(:csv_path) { File.expand_path(File.dirname(__FILE__) + '/support/test.csv') }
  let(:email) { 'test@example.com' }
  let(:multiple_emails) { 'jim@example.com, tom@example.com, bob@example.org, james@example.net' }

  it 'should return the sum of each email provider' do
    expected_result = [['example.com', 3], ['example.org', 2], ['example.net', 1]]
    Ampersat.domains(csv_path).should == expected_result
  end

  it 'should return the email providers with the most common first' do
    incorrect_result = [['example.org', 2],['example.com', 3], ['example.net', 1]]
    Ampersat.domains(csv_path).should_not == incorrect_result

    expected_result = [['example.com', 3], ['example.org', 2], ['example.net', 1]]
    Ampersat.domains(csv_path).should == expected_result
  end

  it 'should find the domain of an email address' do
    Ampersat.find_domain(email).should == 'example.com'
  end

  describe 'offset' do
    let(:csv_path) { File.expand_path(File.dirname(__FILE__) + '/support/offset.csv') }
    let(:email) { 'test@example.com' }
    let(:multiple_emails) { 'jim@example.com, tom@example.com, bob@example.org, james@example.net' }
    let(:offset) { 1 }

    it 'should return the sum of each email provider' do
      expected_result = [['example.com', 3], ['example.org', 2], ['example.net', 1]]
      Ampersat.domains(csv_path, offset).should == expected_result
    end

    it 'should return the email providers with the most common first' do
      incorrect_result = [['example.org', 2],['example.com', 3], ['example.net', 1]]
      Ampersat.domains(csv_path, offset).should_not == incorrect_result

      expected_result = [['example.com', 3], ['example.org', 2], ['example.net', 1]]
      Ampersat.domains(csv_path, offset).should == expected_result
    end
  end

end
