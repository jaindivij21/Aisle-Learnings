require 'yaml'

module Checkout
  class Parser
    # Constants
    EXEMPT_KEYWORDS = YAML.load_file(File.expand_path("./constants/exempt_items.yaml", __dir__)).values.flatten

    # Parses the input string into an array of Item objects
    # @param input [String] The input string containing item descriptions
    # @return [Array<Item>] An array of Item objects
    def self.parse_input(input)
      input.strip.split("\n").map { |line| parse_line(line) }
    end

    # Parses a single line of input into an Item object
    # @param line [String] The input line containing item description
    # @return [Item] An Item object
    # @raise [ArgumentError] If the format is invalid
    def self.parse_line(line)
      description, price_str = line.strip.split(" at ", 2)
      raise ArgumentError, "Invalid input line: #{line}" if description.nil? || price_str.nil?

      # Convert price_str to float using .to_f and check if it's valid
      price = price_str.to_f
      raise ArgumentError, "Invalid price format: #{price_str}" if price <= 0

      tokens = description.strip.split(" ")

      # Convert quantity using .to_i and check if it's valid
      quantity = tokens.shift.to_i
      raise ArgumentError, "Invalid quantity format" if quantity <= 0

      name = tokens.join(" ").downcase

      # Check if item is imported and exempt
      imported = name.include?("imported")
      exempt = EXEMPT_KEYWORDS.any? { |word| name.include?(word) }

      Item.new(
        name, price, quantity, imported: imported, exempt: exempt
      )
    end
  end
end