require 'thor'
require 'ampersat'

module Ampersat
  class CLI < Thor

    default_task :help

    desc 'domains </path/to/file.csv>', 'Analyse a CSV'
    method_option :offset, type: :numeric, default: 0
    method_option :file, required: true, type: :string
    def domains
      domains = Ampersat.domains(File.expand_path(options[:file]), options[:offset])
      domains.each do |domain, count|
        puts "#{domain}: #{count}"
      end
    end

  end
end
