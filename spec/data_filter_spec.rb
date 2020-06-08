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
      expect(data_filter.product_price.count).to eql(50)
    end
  end

  describe '#product_rating' do
    it 'returns the number of product rating per page' do
      expect(data_filter.product_rating.count).not_to eql(0)
    end
  end

  describe '#product_maker' do
    it 'returns the number of makers of product per page' do
      expect(data_filter.product_maker.count).not_to eql(0)
    end
  end

  describe '#product_name' do
    it 'returns the number of names of product per page' do
      expect(data_filter.product_name.count).not_to eql(0)
    end
  end
end
