module Checkout
  class TaxCalculator
    # Constants
    GST_TAX = 0.10
    IMPORT_TAX = 0.05
    ROUNDING_FACTOR = 0.05

    # Getters
    attr_reader :item, :tax_rate

    # Constructor
    # @param item [Item] The item class object
    # @return [TaxCalculator] The tax calculator object
    def initialize(item)
      @item = item
      @tax_rate = (item.exempt ? 0 : GST_TAX) + (item.imported ? IMPORT_TAX : 0)
    end

    def calculate
      raw_tax = item.price * tax_rate

      ((round_tax(raw_tax)) * item.quantity).round(2)
    end

    private

    # Rounds the tax amount to the nearest ROUNDING_FACTOR
    # @param tax [Float] The tax amount
    # @return [Float] The rounded tax amount
    def round_tax(tax)
      ((tax / ROUNDING_FACTOR).ceil) * ROUNDING_FACTOR
    end
  end
end
