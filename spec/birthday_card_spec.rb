require 'birthday_card'

describe 'Birthday_Card' do
  it 'will confirm whether your birthday is today' do
    todays_date = Time.now.strftime('%d/%m/%Y')
    birthday = Birthday_Card.new("#{todays_date}", 'Ogonna Okafor' )
    expect(birthday.confirmation?).to eq true
  end
  it 'will will tell you how many days untill your birthday' do
    future_year = (Time.now + 365 * 86400).strftime('%Y')
    new_birthday = '01/06/21'[0...6] + future_year
    todays_date = Time.now.strftime('%d/%m/%Y')
    result = Date.parse(new_birthday).mjd - Date.parse(todays_date).mjd
    birthday_new = Birthday_Card.new('01/06/21', 'Ogonna Okafor')
    expect(birthday_new.confirmation?).to eq false
    expect(birthday_new.days_till_birthday).to eq result
  end
end