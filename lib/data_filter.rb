require_relative('page_parser')
class DataFilter < PageParser
  attr_accessor :document, :cards

  def initialize(document)
    @document = document
  end

  def filter_by_class(css_class, parsed_page)
    super
  end

  def item_cards
    @cards = filter_by_class('li.zg-item-immersion', @document)
  end

  def product_price
    filter_by_class('span.p13n-sc-price', @cards)
  end

  def product_rating
    filter_by_class('span.a-icon-alt', @cards)
  end

  def product_rating_number
    filter_by_class('div.a-icon-row a.a-size-small', @cards)
  end

  def product_maker
    filter_by_class('a.a-size-small', @cards)
  end

  def product_name
    filter_by_class('a.a-link-normal div[data-rows="1"]', @cards)
  end

  def product_link
    filter_by_class('div.a-row a.a-link-normal', @cards)
  end
end
