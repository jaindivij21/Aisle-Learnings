#!/usr/bin/env ruby
# Command-line interface for a checkout system that collects item inputs and generates a receipt.
require_relative '../lib/checkout/checkout_module'

# Prompt for user input
PROMPT = <<~MSG
  Enter your items one per line (e.g., '1 imported bottle of perfume at 27.99')
  Type 'done' or press Enter twice to finish:
MSG

# Display prompt and collect item inputs till 'done' or empty line
puts PROMPT
input_lines = []
while (line = gets&.strip)
  break if line.downcase == 'done' || line.empty?
  input_lines << line
end

# Process input and generate receipt
begin
  # Parse input and generate receipt
  items = Checkout::Parser.parse_input(input_lines.join("\n"))
  receipt = Checkout::Receipt.new(items)
  puts "\n------ Receipt ------\n#{receipt.generate}"
rescue ArgumentError => e
  puts "Invalid input: #{e.message}"
  exit(1)
rescue StandardError => e
  puts "Error: #{e.message}"
  exit(1)
end