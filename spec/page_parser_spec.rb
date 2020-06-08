require 'rspec'
require 'page_parser'

RSpec.describe PageParser do
  let(:page_parser) do
    PageParser.new('https://www.amazon.com/Best-Sellers
    -Books-Deals/zgbs/books/45/ref=zg_bs_pg_1?_encoding=UTF8&pg=1')
  end

  describe '#url' do
    it 'has a setter and getter for the url attribute ' do
      page_parser.url = 'https://www.amazon.com/Best-Sellers-Books-Deals/zgbs/books/45/ref=zg_bs_pg_1?_encoding=UTF8&pg=1'
      expect(page_parser.url).to eql('https://www.amazon.com/Best-Sellers-Books-Deals/zgbs/books/45/ref=zg_bs_pg_1?_encoding=UTF8&pg=1')
    end
  end
  describe '#bring_unparsed_page' do
    it 'returns a none nil page for a valid url' do
      page_parser.url = 'https://www.amazon.com/Best-Sellers-Books-Deals/zgbs/books/45/ref=zg_bs_pg_1?_encoding=UTF8&pg=1'
      expect(page_parser.bring_unparsed_page).not_to eql(nil)
    end
  end
  describe '#parsed_page' do
    it 'has a getter for the parsed_page attribute' do
      page_parser.url = 'https://www.amazon.com/Best-Sellers-Books-Deals/zgbs/books/45/ref=zg_bs_pg_1?_encoding=UTF8&pg=1'
      page_parser.parse_page
      expect(page_parser.parsed_page).not_to eql(nil)
    end
  end

  describe '#parse_page' do
    it 'returns a parsed page for a vialble url' do
      page_parser.url = 'https://www.amazon.com/Best-Sellers-Books-Deals/zgbs/books/45/ref=zg_bs_pg_1?_encoding=UTF8&pg=1'
      page_parser.parse_page
      expect(page_parser.parse_page).not_to eql(nil)
    end
  end
  describe '#intialize' do
    it 'has an initialize that sets the url attribute' do
      page_parser = PageParser.new('https://www.amazon.com/Best-Sellers-Books-Deals/zgbs/books/45/ref=zg_bs_pg_1?_encoding=UTF8&pg=1')
      expect(page_parser.url).to eql('https://www.amazon.com/Best-Sellers-Books-Deals/zgbs/books/45/ref=zg_bs_pg_1?_encoding=UTF8&pg=1')
    end
  end
end
