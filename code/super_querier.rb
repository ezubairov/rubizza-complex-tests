require 'ostruct'

class SuperQuerier
  API_KEY = 'tests_are_nice_and_so_are_we'

  def self.complex_query(repository: ProductionRepository)
    repository.complex_query + 2
  end

  def self.long_request
    results = APIClient.new(api_key: API_KEY).make_request
    results.body.upcase
  end
end

class ProductionRepository
  def self.complex_query
    x = 0
    while x != 3
      sleep 1
      x += 1
      puts "took #{x} seconds"
    end
    2
  end
end

class APIClient
  attr_reader :api_key

  def initialize(api_key:)
    @api_key = api_key
  end

  def make_request
    x = 0
    while x != 5
      sleep 1
      x += 1
      puts "took #{x} seconds"
    end

    OpenStruct.new(body: 'request_payload')
  end
end
