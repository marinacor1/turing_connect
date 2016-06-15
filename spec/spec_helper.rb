require 'simplecov'
SimpleCov.start 'rails'

# require 'vcr'

# VCR.configure do |c|
#   c.cassette_library_dir = 'spec/fixtures/vcr_cassettes'
#   c.hook_into :webmock
#   c.cofigure_rspec_metadata!
# end

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end


end
