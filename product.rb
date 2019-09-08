# frozen_string_literal: true

class Product
  def initialize(url)
    @url = url
  end

  def parse_data
    title = html_document.xpath('//h1[contains(@class ,"product_main_name")]').first.content.strip
  end

  def html_document
    Nokogiri::HTML(http_response.body)
  end

  def http_response
    Curl.get(@url)
  end
end
