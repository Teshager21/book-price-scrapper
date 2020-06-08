require_relative('page_parser')
class DataFilter < PageParser
  attr_accessor :document, :cards, :page

  def initialize(document)
    @document = document
    @page = []
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

  def product_data(item)
    { name: product_name[item].text.strip,
      maker: product_maker[item].text.strip,
      price: product_price[item].text.strip,
      rating: product_rating[item].text.strip,
      rating_num: product_rating_number[item].text.strip,
      link: 'https://www.amazon.com' + product_link[item].attr('href') }
  end

  def product_page
    (0..@cards.count).each do |i|
      begin
        @page << product_data(i)
      rescue StandardError
        @page << ' '
      end
      # puts "\n #{page[i].keys} \n: #{page[i].values}\n"
    end
  end
end
