# frozen_string_literal: true

require 'rubygems'
require 'bundler/setup'
Bundler.require(:default)

require 'open-uri'

require_relative 'product'

Product.download_page
Product.all
