require 'birthday_card'

describe 'Birthday_Card' do
  it 'will confirm whether your birthday is today' do
    birthday = Birthday_Card.new('14/05/2021', 'Ogonna Okafor' )
    expect(birthday.confirmation?).to eq true
  end
end