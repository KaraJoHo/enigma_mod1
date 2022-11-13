require 'rspec'
require './lib/shifter'
require './lib/cryptor'

RSpec.describe Cryptor do
  it 'exists' do
    cryptor = Cryptor.new

    expect(cryptor).to be_a(Cryptor)
  end

  it 'has a shifter object' do
    cryptor = Cryptor.new
    shifter = Shifter.new

    expect(cryptor.shifter).to be_a(Shifter)
  end
end
