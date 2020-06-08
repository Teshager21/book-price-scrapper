require 'rspec'
require 'data_filter'
require 'page_parser'

RSpec.describe DataFilter do
  let(:doc) do
    page_parser = PageParser.new('https://www.amazon.com/Best-Sellers-Books
   -Deals/zgbs/books/45/ref=zg_bs_pg_1?_encoding=UTF8&pg=1')
    page_parser.parse_page
    page_parser.parsed_page
  end
  let(:data_filter) { DataFilter.new(doc) }
  describe '#document'
  it 'has a getter for the document attribute' do
    expect(data_filter.document).not_to eql(nil)
  end
  describe '#initialize'
  it 'has an intialize method that sets the document attribute' do
    data_filter = DataFilter.new(doc)
    expect(data_filter.document).not_to eql(nil)
  end
  describe '#item_cards'
  it 'returns 50 card items per page' do
    expect(data_filter.item_cards.count).to eql(50)
  end
end
