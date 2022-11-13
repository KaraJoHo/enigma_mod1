require 'rspec'
require './lib/shifter'
require './lib/cryptor'

RSpec.describe Cryptor do
  it 'exists' do
    cryptor = Cryptor.new

    expect(cryptor).to be_a(Cryptor)
  end
end
