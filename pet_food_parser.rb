# frozen_string_literal: true

require 'rubygems'
require 'bundler/setup'
Bundler.require(:default)

require 'open-uri'

require_relative 'category'
require_relative 'product'

url = ARGV[0]
# file_name = ARGV[1]

puts 'Parsing started...'

puts 'Products links loading...'

links = Category.load_products_links(url)

a = Product.new(links[0])
a.parse_data

binding.pry

