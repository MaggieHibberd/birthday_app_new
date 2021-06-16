require 'birthday_card'

describe 'Birthday_Card' do
  it 'will confirm whether your birthday is today' do
    todays_date = Time.now.strftime('%d/%m/%Y')
    birthday = BirthdayCard.new("#{todays_date}", 'Ogonna Okafor' )
    expect(birthday.confirmation?).to eq true
  end
  it 'will return false confirming the user birthday is not today for a future date' do
    test_date = (Time.now + 5 * 86400).strftime('%d/%m/%Y')
    expect(BirthdayCard.new(test_date, 'Ogonna Okafor').confirmation?).to eq false
  end
  it 'will tell you how many days untill your birthday this year' do
    test_date = (Time.now + 5 * 86400).strftime('%d/%m/%Y')
    result = Date.parse(test_date).mjd - Date.parse(Time.now.strftime('%d/%m/%Y')).mjd
    expect(BirthdayCard.new(test_date, 'Ogonna Okafor').days_till_birthday).to eq result
  end
  it 'will return false confirming the user birthday is not today for a past date' do
    test_date = (Time.now - 5 * 86400).strftime('%d/%m/%Y')
    expect(BirthdayCard.new(test_date, 'Ogonna Okafor').confirmation?).to eq false
  end
  it ' will tell you how many days untill your birthday in a future year' do
    test_date = (Time.now - 5 * 86400).strftime('%d/%m/%Y')
    future_birthday = test_date[0...6] + (Time.now + 365 * 86400).strftime('%Y')
    result = Date.parse(future_birthday).mjd - Date.parse(Time.now.strftime('%d/%m/%Y')).mjd
    expect(BirthdayCard.new(future_birthday, 'Ogonna Okafor').days_till_birthday).to eq result
  end
end
