module Checkout
  class Receipt
    # Constructor
    # @param items [Array<Item>] The array of Item objects
    # @return [Receipt] The receipt object
    def initialize(items)
      @items = items
    end

    # Generates the receipt string
    # @return [String] The formatted receipt string
    def generate
      total_tax = 0
      total_price = 0
      output = ""

      @items.each do |item|
        tax_calculator = Checkout::TaxCalculator.new(item)
        tax = tax_calculator.calculate

        total = item.price * item.quantity + tax
        total_tax += tax
        total_price += total
        output += "#{item.quantity} #{item.name}: #{format('%.2f', total)}\n"
      end

      output += "Sales Taxes: #{format('%.2f', total_tax)}\n"
      output += "Total: #{format('%.2f', total_price)}"

      output
    end
  end
end