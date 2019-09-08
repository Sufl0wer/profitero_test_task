# frozen_string_literal: true

require 'rubygems'
require 'bundler/setup'
Bundler.require(:default)

require 'open-uri'
require 'csv'

require_relative 'category'
require_relative 'product'
require_relative 'file_writer'

url = ARGV[0]
file_name = ARGV[1]

puts 'Parsing started...'

puts 'Products links loading...'
links = Category.load_products_links(url)

puts 'Starting products parsing...'
links.each_with_index do |link, index|
  puts "product #{index + 1} parsing..."
  FileWriter.write(file_name, Product.parse_data(link))
end

puts 'Parsing successfully finished'
