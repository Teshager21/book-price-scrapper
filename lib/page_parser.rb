require 'httparty'
require 'nokogiri'
class PageParser
  attr_accessor :url
  attr_reader :parsed_page, :unparsed_page
  def bring_unparsed_page
    @unparsed_page = HTTParty.get(@url)
  end

  def parse_page
    @parsed_page = Nokogiri::HTML(unparsed_page)
  end
end

# page_parser = PageParser.new
# page_parser.url = 'https://www.amazon.com/Best-Sellers-Books-Deals/zgbs/books/45/ref=zg_bs_pg_1?_encoding=UTF8&pg=1'
# page_parser.bring_unparsed_page
# page_parser.parse_page

# puts page_parser.parsed_page
