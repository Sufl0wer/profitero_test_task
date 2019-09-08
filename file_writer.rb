# frozen_string_literal: true

class FileWriter
  class << self
    def write(file_name, product_data)
      create_file(file_name) unless File.exist?(file_name)
      CSV.open(file_name, 'a+') do |csv|
        (0...product_data[:names].size).each do |index|
          csv << [product_data[:names][index], product_data[:prices][index], product_data[:image]]
        end
      end
    end

    private

    def create_file(file_name)
      CSV.open(file_name, 'wb') do |csv|
        csv << %w[name price image]
      end
    end
  end
end
