# Sales Tax Application

## Description
This Ruby application calculates and prints sales tax receipts for shopping carts. It applies:
- 10% basic sales tax on all goods except books, food, and medical products.
- An additional 5% import duty on all imported goods with no exemptions.

Sales tax is rounded up to the nearest 0.05 as per requirements.

## Features
- Modular object-oriented design
- Sales tax calculation and receipt generation
- Input parsing from raw strings
- CLI tool for generating receipts
- RSpec test suite

## Prerequisites

- Ruby 2.7.8
- `rspec` and `yaml` gems (included in the `Gemfile`).

## Project Setup

1. **Install Dependencies**:
   First, setup ruby and install the required gems using Bundler: `bundle install`

2. **YAML Configuration File**:
    The application uses a YAML configuration file to define tax rates and exemptions. `lib/checkout/constants/exempt_items.yaml`
3. Making the Script Executable
  - Give Permissions to the Executable: `chmod +x bin/main`
  - Run the Script: `./bin/main.rb`

### CLI Working Screenshot
<img width="557" alt="image" src="https://github.com/user-attachments/assets/e8d959b0-14fa-40e6-8a15-ef0fcde28977" />
