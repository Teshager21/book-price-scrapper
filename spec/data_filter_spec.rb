require 'rspec'
require 'data_filter'
require 'page_parser'

RSpec.describe DataFilter do
  let(:doc) do
    page_parser = PageParser.new('https://www.amazon.com/Best-Sellers-Books-Deals/zgbs/books/45/ref=zg_bs_pg_1?_encoding=UTF8&pg=1')

    page_parser.bring_unparsed_page
    page_parser.parse_page
    return page_parser.parsed_page
  end
  let(:data_filter) { DataFilter.new(doc) }
  describe '#document' do
    it 'has a getter for the document attribute' do
      expect(data_filter.document).not_to eql(nil)
    end
  end
  describe '#initialize' do
    it 'has an intialize method that sets the document attribute' do
      expect(data_filter.document).not_to eql(nil)
    end
  end
  describe '#item_cards' do
    it 'returns 50 card items per page' do
      expect(data_filter.item_cards.count).to eql(50)
    end
  end

  describe '#product_price' do
    it 'returns the number of product prices per page' do
      data_filter.item_cards
      expect(data_filter.product_price.count).to eql(50)
    end
  end

  describe '#product_rating' do
    it 'returns the number of product rating per page' do
      data_filter.item_cards
      expect(data_filter.product_rating.count).not_to eql(0)
    end
  end

  describe '#product_rating_number' do
    it 'returns a non-zero number of ratings per non-empty page' do
      data_filter.item_cards
      expect(data_filter.product_rating_number.count).not_to eql(0)
    end
  end

  describe '#product_maker' do
    it 'returns the number of makers of product per page' do
      data_filter.item_cards
      expect(data_filter.product_maker.count).not_to eql(0)
    end
  end

  describe '#product_name' do
    it 'returns the number of names of product per page' do
      data_filter.item_cards
      expect(data_filter.product_name.count).to eql(50)
    end
  end
  describe '#product_link' do
    it 'returns the number of links of product per page' do
      data_filter.item_cards
      expect(data_filter.product_link.count).to eql(50)
    end
  end
  describe '#product_data' do
    it 'returns the detail of a given product' do
      data_filter.item_cards
      expect(data_filter.product_data(1)).to eql(
        { name: 'I Know Why the Caged Bird Sings', maker: '6,709', price: '$7.99',
          rating: '4.7 out of 5 stars', rating_num: '4,571',
          link: 'https://www.amazon.com/Know-Why-Caged-Bird-Sings/dp/0345514408?_encoding=UTF8&psc=1' }
      )
    end
  end

  describe '#product_page' do
    it 'returns 50 item array of products per page' do
      data_filter.item_cards
      expect(data_filter.product_page.count).to eql(51)
    end
  end
end
