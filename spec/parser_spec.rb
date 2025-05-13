require_relative './spec_helper.rb'

RSpec.describe Checkout::Parser do
  describe ".parse_input" do
    it "parses the input string into an array of Item objects" do
      input = "1 imported box of chocolates at 10.00\n5 bottle of perfume at 47.50"
      items = Checkout::Parser.parse_input(input)

      expect(items.size).to eq(2)
      expect(items[0].name).to eq("Box Of Chocolates")
      expect(items[0].price).to eq(10.00)
      expect(items[0].quantity).to eq(1)
      expect(items[0].imported).to be true
      expect(items[1].name).to eq("Bottle Of Perfume")
      expect(items[1].price).to eq(47.50)
      expect(items[1].quantity).to eq(5)
    end
  end

  describe ".parse_line" do
    it "parses a valid line into an Item object" do
      line = "1 imported box of chocolates at 10.00"
      item = Checkout::Parser.parse_line(line)

      expect(item.name).to eq("Box Of Chocolates")
      expect(item.price).to eq(10.00)
      expect(item.quantity).to eq(1)
      expect(item.imported).to be true
      expect(item.exempt).to be true
    end

    it "raises an error for an invalid line format" do
      line = "invalid line format"
      expect { Checkout::Parser.parse_line(line) }.to raise_error(ArgumentError)
    end

    it "raises an error for an invalid price format" do
      line = "1 imported box of chocolates at -10.00"
      expect { Checkout::Parser.parse_line(line) }.to raise_error(ArgumentError)
    end
  end
end
