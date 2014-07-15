require 'thor'
require 'ampersat'

module Ampersat
  class CLI < Thor

    default_task :help

    desc 'domains </path/to/file.csv>', 'Analyse a CSV, returning domain list'
    method_option :column, type: :numeric, default: 0
    method_option :file, required: true, type: :string
    def domains
      domains = Ampersat.domains(File.expand_path(options[:file]), options[:column])
      domains.each do |domain, count|
        puts "#{ domain }: #{ count }"
      end
    end

    desc 'mx </path/to/file.csv>', 'Analyse a CSV, returning MX list'
    method_option :column, type: :numeric, default: 0
    method_option :file, required: true, type: :string
    def mx
      mxs = Ampersat.mxs(File.expand_path(options[:file]), options[:column])
      mxs.each do |mx, value|
        puts "#{ mx } - #{ value['addresses'] }: #{ value['domains'].join(', ') }"
      end
    end

  end
end
