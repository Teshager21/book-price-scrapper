require 'rspec'
require 'page_parser'

RSpec.describe PageParser do
  let(:page_parser) do
    PageParser.new('https://www.amazon.com/Best-Sellers-Books-Deals/zgbs/books/45/ref=zg_bs_pg_1?_encoding=UTF8&pg=1')
  end
  describe '#parse_page' do
    it 'returns a parsed page for a vialble url' do
      page_parser.parse_page
      expect(page_parser.parsed_page).not_to eql(nil)
    end
  end
  describe '#intialize' do
    it 'has an initialize that sets the url attribute' do
      expect(page_parser.unparsed_page).not_to eql(nil)
    end
  end
end
