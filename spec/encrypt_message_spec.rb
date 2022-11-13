require 'rspec'
require './lib/encrypt_message'
require './lib/shifter'

RSpec.describe EncryptMessage do
  it 'exists' do
    encrypt_message = EncryptMessage.new
    expect(encrypt_message).to be_a(EncryptMessage)
  end
end
