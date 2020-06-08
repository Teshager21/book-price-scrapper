require 'rspec'
require 'data_filter'

RSpec.describe DataFilter do
  data_filter = DataFilter.new
  describe '#document'
  it 'has a getter for the document attribute' do
    expect(data_filter.document).not_to eql(nil)
  end
end
