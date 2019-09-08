# frozen_string_literal: true

class Category
  PRODUCTS_CLASS = '//div[@class="product-container"]/div/div/a/@href'

  attr_reader :products_links

  def initialize(url)
    @url = url
    @products_links = []
  end

  def self.load_products_links(url)
    Category.new(url).load_products_links
  end

  def load_products_links
    until links_on_current_page(page ||= 1).empty?
      links_on_current_page(page).each do |link|
        @products_links << link.value
      end

      puts "page #{page} loading..."
      page += 1
    end
    products_links
  end

  private

  def links_on_current_page(page)
    html_document(page).xpath(PRODUCTS_CLASS)
  end

  def html_document(page)
    Nokogiri::HTML(http_response(page).body)
  end

  def http_response(page)
    if page == 1
      Curl.get(@url)
    else
      Curl.get(@url + "?p=#{page}")
    end
  end
end
