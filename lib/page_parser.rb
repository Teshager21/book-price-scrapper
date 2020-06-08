require 'httparty'

class PageParser
  attr_accessor :url
  def bring_unparsed_page
    unparsed_page = HTTParty.get(@url)
    unparsed_page
  end
end
