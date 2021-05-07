require 'birthday_card'


describe 'Birthday_Card' do
  it 'will confirm whether your birthday is today' do
    birthday = Birthday_Card.new 
    expect(birthday.confirmation("07/05/2021")).to eq true
  end
end