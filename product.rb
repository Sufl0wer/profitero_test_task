# frozen_string_literal: true

class Product
  DENTAL_HYGIENE_LINK = 'https://www.petsonic.com/snacks-higiene-dental-para-perros/'

  def self.download_page
    @doc = Nokogiri::HTML(URI.open(DENTAL_HYGIENE_LINK))
  end

  def self.all
    binding.pry
  end
end
