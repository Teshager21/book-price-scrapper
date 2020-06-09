require 'httparty'
require 'nokogiri'
class PageParser
  attr_accessor :url
  attr_reader :parsed_page, :unparsed_page
  def bring_unparsed_page
    @unparsed_page = HTTParty.get(@url)
  end

  def parse_page
    bring_unparsed_page
    @parsed_page = Nokogiri::HTML(@unparsed_page.body)
  end

  def filter_by_class(css_class, parsed_page = @parsed_page)
    parsed_page.css(css_class)
  end

  def initialize(url)
    @url = url
    @parsed_page = nil
    @unparsed_page = nil
  end
end
