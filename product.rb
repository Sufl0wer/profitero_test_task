# frozen_string_literal: true

class Product
  attr_reader :data

  def initialize(url)
    @url = url
    @data = {}
  end

  def title
    @title ||= html_document.xpath('//h1[contains(@class ,"product_main_name")]').first.content.strip
  end

  def parse_data
    @data[:names] = names
    @data[:prices] = prices
    @data[:image] = image
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
    @weights ||= html_document.xpath('//span[contains(@class, "radio_label")]').to_a.map(&:content)
  end

  def prices
    html_document.xpath('//span[contains(@class, "price_comb")]').to_a.map(&:content)
  end

  def image
    html_document.xpath('//img[@id="bigpic"]/@src').first.content.strip
  end

  def html_document
    @html_document ||= Nokogiri::HTML(http_response.body)
  end

  def http_response
    Curl.get(@url)
  end
end
