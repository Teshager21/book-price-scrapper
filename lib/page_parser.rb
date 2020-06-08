require 'httparty'
require 'nokogiri'
class PageParser
  attr_accessor :url
  attr_reader :parsed_page, :unparsed_page
  def bring_unparsed_page
    @unparsed_page = HTTParty.get(@url)
  end

  def parse_page
    @parsed_page = Nokogiri::HTML(@unparsed_page.body)
  end

  def initialize(url)
    @url = url
    @parsed_page = nil
    @unparsed_page = nil
  end
end
