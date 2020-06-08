require_relative('page_parser')
require 'nokogiri'
class DataFilter
  attr_accessor :document

  def initialize(document)
    @document = document
  end
end
