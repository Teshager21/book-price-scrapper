require 'httparty'
require 'nokogiri'
class PageParser
  attr_reader :parsed_page, :unparsed_page

  def parse_page
    @parsed_page = Nokogiri::HTML(@unparsed_page.body)
  end

  def filter_by_class(css_class, parsed_page = @parsed_page)
    parsed_page.css(css_class)
  end

  def initialize(url)
    try = 3
    @parsed_page = nil
    begin
      @unparsed_page = HTTParty.get(url)
    rescue StandardError
      retry unless (try -= 1).zero?
      if try.zero?
        puts 'Failed to connect to server'
        exit
      end
    end
  end
end
