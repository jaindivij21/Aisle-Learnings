require_relative './spec_helper.rb'

RSpec.describe Checkout::TaxCalculator do
  describe "#calculate" do
    it "calculates tax for an item with no exemptions or imports" do
      item = Checkout::Item.new("tea", 12.49, 1, imported: false, exempt: false)
      tax_calculator = Checkout::TaxCalculator.new(item)

      expect(tax_calculator.calculate).to eq(1.25)
    end

    it "calculates tax for an item with no exemptions but imported" do
      item = Checkout::Item.new("imported tea", 12.49, 2, imported: true, exempt: false)
      tax_calculator = Checkout::TaxCalculator.new(item)

      expect(tax_calculator.calculate).to eq(2 * 1.90)
    end

    it "calculates tax for an item with exemptions but no imports" do
      item = Checkout::Item.new("book", 12.49, 1, imported: false, exempt: true)
      tax_calculator = Checkout::TaxCalculator.new(item)

      expect(tax_calculator.calculate).to eq(0.00)
    end

    it "calculates tax for an item with both exemptions and imports" do
      item = Checkout::Item.new("imported chocolate", 10.00, 1, imported: true, exempt: true)
      tax_calculator = Checkout::TaxCalculator.new(item)

      expect(tax_calculator.calculate).to eq(0.50)
    end
  end
end
