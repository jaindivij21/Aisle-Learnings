require_relative './spec_helper.rb'

RSpec.describe Checkout::Item do
  describe "#initialize" do
    it "correctly initializes an item" do
      item = Checkout::Item.new("imported box of chocolates", 10.0, 1, imported: true, exempt: true)
      expect(item.name).to eq("Box Of Chocolates")
      expect(item.price).to eq(10.0)
      expect(item.quantity).to eq(1)
      expect(item.imported).to be true
      expect(item.exempt).to be true
    end
  end

  describe "#normalize_name" do
    it "normalizes the name by capitalizing first letters and removing 'imported'" do
      item = Checkout::Item.new("imported box of chocolates", 10.0, 1, imported: true, exempt: true)
      expect(item.send(:normalize_name, "imported box of chocolates")).to eq("Box Of Chocolates")
    end
  end
end
