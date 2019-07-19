require_relative '../../code/super_querier'
require_relative '../spec_helper'
require 'ostruct'

describe SuperQuerier do
  describe '.complex_query' do
    subject { described_class.complex_query }
    # subject { described_class.complex_query(repository: TestRepository) }

    context 'happy path' do
      it 'returns four' do
        expect(subject).to eq 4
      end
    end
  end

  describe '.long_request' do
    subject { described_class.long_request }
    # before do
    #   allow_any_instance_of(APIClient).to receive(:make_request).and_return(OpenStruct.new(body: 'request_payload')) }
    # end

    context 'happy path' do
      it 'returns request body upcased' do
        expect(subject).to eq 'REQUEST_PAYLOAD'
      end
    end
  end
end


class TestRepository
  def self.complex_query
    2
  end
end
