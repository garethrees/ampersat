require 'ampersat/version'
require 'csv'
require 'public_suffix'
require 'ruby-progressbar'
require 'resolv'
require 'celluloid/pmap'

module Ampersat

  def self.domains(email_list, offset=0)
    domains = Hash.new(0)

    CSV.foreach(email_list) do |row|
      domain = Ampersat.find_domain(row[offset])
      domains[domain] = domains[domain] + 1
    end

    domains.sort_by {|key, value| - value}
  end

  def self.mxs(email_list, offset=0)
    mxs = Hash.new(0)
    domains = Ampersat.domains(email_list, offset)
    progressbar = ProgressBar.create(format: '%t: %c / %C |%B|', starting_at: 0, total: domains.length)
    domains.pmap(100) do |domain, qty|
      mx = Ampersat.find_mx(domain)
      mxs[mx] = mxs[mx] + qty
      progressbar.increment
    end

    mxs.sort_by {|key, value| - value}
  end

  def self.find_domain(email)
    email.split('@').last.downcase
  end

  def self.find_mx(domain)
    @mxs ||= {}
    @mxs[domain] ||= begin
      Resolv::DNS.open(nameserver: '8.8.8.8') do |dns|
        next unless PublicSuffix.valid?(domain)
        response = dns.getresources(domain, Resolv::DNS::Resource::IN::MX)
        next unless response.any?
        response.collect { |r| r.exchange.to_s.downcase }.sort.first
      end
    end
  end

end
