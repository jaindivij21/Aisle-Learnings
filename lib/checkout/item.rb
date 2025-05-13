module Checkout
  class Item
    # Constants
    EXEMPT_ITEM_TYPES = %w[books food pharmaceuticals].freeze

    # Getters
    attr_reader :name, :price, :quantity, :imported, :exempt

    # Constructor
    # @param name [String] The name of the item
    # @param price [Float] The price of the item
    # @param quantity [Integer] The quantity of the item
    # @return [Item] The item object
    def initialize(name, price, quantity, imported: false, exempt: false)
      @name = normalize_name(name)
      @price = price
      @quantity = quantity
      @imported = imported
      @exempt = exempt
    end

    private

    # Normalize the name of the item
    # @param name [String] The name of the item
    # @return [String] The normalized name
    # @example ["imported book"] => "Book"
    # @example ["packet of headache pills"] => "Packet Of Headache Pills"
    def normalize_name(name)
      name = name.sub(/^imported /i, '')
      name = name.squeeze(' ')

      name.split.map(&:capitalize).join(' ')
    end
  end
end