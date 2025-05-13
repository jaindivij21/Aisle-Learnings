require_relative './spec_helper.rb'

RSpec.describe Checkout::Receipt do
  describe "#generate" do
    it "generates a formatted receipt string" do
      item1 = Checkout::Item.new("imported box of chocolates", 10.00, 1, imported: true, exempt: true)
      item2 = Checkout::Item.new("bottle of perfume", 47.50, 1)
      items = [item1, item2]
      receipt = Checkout::Receipt.new(items)

      expected_output = "1 Box Of Chocolates: 10.50\n1 Bottle Of Perfume: 52.25\nSales Taxes: 5.25\nTotal: 62.75"
      expect(receipt.generate).to eq(expected_output)
    end
  end
end
