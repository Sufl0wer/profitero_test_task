# frozen_string_literal: true

require 'rubygems'
require 'bundler/setup'
Bundler.require(:default)

require 'open-uri'

require_relative 'category'

url = ARGV[0]
# file_name = ARGV[1]

puts 'Parsing started...'

puts 'Products links loading...'

a = Category.load_products_links(url)

binding.pry

