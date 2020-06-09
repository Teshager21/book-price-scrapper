require_relative('page_parser')
class DataFilter < PageParser
  attr_reader :cards, :document, :page
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

  def product_maker(category)
    if %w[b bg cp].include?(category)
      filter_by_class('span.a-size-small', @cards)
    else
      temp = filter_by_class('span.a-size-small', @cards)
      filter_by_class('span.a-color-base', temp)
    end
  end

  def product_name(category)
    if %w[b m].include? category
      filter_by_class('a.a-link-normal div[data-rows="1"]', @cards)
    else
      filter_by_class('a.a-link-normal div[data-rows="2"]', @cards)
    end
  end

  def product_link
    filter_by_class('div.a-row a.a-link-normal', @cards)
  end

  def to_text(given)
    if given.nil?
      'Not given'
    else
      given.text
    end
  end

  def product_data(item, category)
    { name: to_text(product_name(category)[item]).strip.upcase,
      maker: to_text(product_maker(category)[item]).strip,
      price: to_text(product_price[item]).strip,
      rating: to_text(product_rating[item]).strip,
      rating_num: to_text(product_rating_number[item]).strip,
      link: 'https://www.amazon.com' + product_link[item].attr('href') }
  end

  def product_page(category)
    table = ''
    (0..@cards.count).each do |i|
      begin
        @page << product_data(i, category)

        (0..5).each do |j|
          table += "\n    #{product_data(i, category).keys[j].upcase}:  #{product_data(i, category).values[j]}"
        end
        table += "\n  _____________________________________________________________________________________________" \
        "_______________________________________________________________________________________\n"
      rescue StandardError
        @page << ' '
      end
    end
    table
  end
end
