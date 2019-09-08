# frozen_string_literal: true

class Product
  TITLE_CLASS = '//h1[contains(@class ,"product_main_name")]'
  WEIGHT_CLASS = '//span[contains(@class, "radio_label")]'
  PRICE_CLASS = '//span[contains(@class, "price_comb")]'
  IMAGE_CLASS = '//img[@id="bigpic"]/@src'

  attr_reader :data

  def initialize(url)
    @url = url
    @data = {}
  end

  def title
    @title ||= html_document.xpath(TITLE_CLASS).first.content.strip
  end

  def self.parse_data(url)
    Product.new(url).parse_data
  end

  def parse_data
    @data[:names] = names
    @data[:prices] = prices
    @data[:image] = image
    @data
  end

  private

  def names
    @names = []
    weights.each do |weight|
      @names << "#{title} - #{weight}"
    end
    @names
  end

  def weights
    @weights ||= html_document.xpath(WEIGHT_CLASS).to_a.map(&:content)
  end

  def prices
    html_document.xpath(PRICE_CLASS).to_a.map(&:content)
  end

  def image
    html_document.xpath(IMAGE_CLASS).first.content.strip
  end

  def html_document
    Nokogiri::HTML(http_response.body)
  end

  def http_response
    Curl.get(@url)
  end
end
