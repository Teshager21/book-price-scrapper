require 'rspec'
require 'page_parser'

RSpec.describe PageParser do
  describe '#url' do
    let(:page_parser) { PageParser.new }
    it 'returns has a setter and getter for the url attribute ' do
      page_parser.url = 'https://www.amazon.com/Best-Sellers-Books-Deals/zgbs/books/45/ref=zg_bs_pg_1?_encoding=UTF8&pg=1'
      expect(page_parser.url).to eql('https://www.amazon.com/Best-Sellers-Books-Deals/zgbs/books/45/ref=zg_bs_pg_1?_encoding=UTF8&pg=1')
    end
  end
end
