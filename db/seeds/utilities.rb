# frozen_string_literal: true

module Seeds
  require 'net/http'
  class Utilities
    # Loads the SVG text from the URL
    #
    # @param url [String] the URL to download the SVG from
    # @return [String] the SVG text
    #
    def self.download_svg(url)
      uri = URI(url)
      response = Net::HTTP.get_response(uri)

      if response.is_a?(Net::HTTPSuccess)
        response.body
      else
        puts "Failed to download SVG for #{url}"
        nil
      end
    rescue StandardError => e
      puts "Error downloading SVG for #{url}: #{e.message}"
      nil
    end
  end
end
