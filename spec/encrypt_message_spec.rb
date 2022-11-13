require './lib/shifter'
require './lib/cryptor'
require './lib/encrypt_message'

RSpec.describe EncryptMessage do
  it 'exists and is a child of cryptor' do
    encrypt_message = EncryptMessage.new

    expect(encrypt_message).to be_a(EncryptMessage)
    expect(EncryptMessage < Cryptor).to eq(true)
  end
end
