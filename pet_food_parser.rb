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

a = Product.new(links[15])
a.parse_data

FileWriter.write(file_name, a.data)

