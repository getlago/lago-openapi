#!/usr/bin/env ruby
# frozen_string_literal: true

require 'yaml'
require 'pathname'

if ARGV.empty?
  warn "Directory not provided, using current directory"
  directory = '.'
else
  directory = ARGV[0].chomp('/')
  abort "Directory #{directory} does not exist" unless Dir.exist?(directory)
end

root_dir = Pathname.new(directory)
invalid_params = []

Dir.glob(File.join(directory, '**', '*.{yml,yaml}')).each do |file|
  data = YAML.safe_load(File.read(file))
  next unless data

  %w[get post put patch delete].each do |method|
    next unless data[method]&.dig('parameters')

    data[method]['parameters'].each do |param|
      next unless param['in'] == 'query' &&
                param['schema']&.dig('type') == 'array' &&
                !param['name']&.end_with?('[]')

      invalid_params << {
        path: Pathname.new(file).relative_path_from(root_dir).to_s,
        method: method.upcase,
        name: param['name'],
        api_path: File.basename(file, File.extname(file))
      }
    end
  end
rescue StandardError => e
  warn "Error processing file #{file}: #{e.message}"
end

if invalid_params.any?
  puts "\nERROR: Found #{invalid_params.length} array parameter(s) without [] suffix:"

  invalid_params.each do |param|
    puts "\n  #{param[:method]} /#{param[:api_path]}"
    puts "    File: #{Pathname.new(directory).join(param[:path])}"
    puts "    Parameter: #{param[:name]}"
    puts "    Fix: Rename to '#{param[:name]}[]'"
  end
  exit 1
end

puts 'All good!'
