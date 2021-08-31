require 'birthday_card'

describe 'Birthday_Card' do
  it 'will confirm whether your birthday is today' do
    todays_date = Date.today
    birthday = BirthdayCard.new("#{todays_date}", 'Ogonna Okafor' )
    expect(birthday.today?).to eq true
  end
  it 'will return false confirming the user birthday is not today for a future date' do
    test_date = Date.today + 5
    expect(BirthdayCard.new("#{test_date}", 'Ogonna Okafor').today?).to eq false
  end
  it 'will tell you how many days untill your birthday this year' do
    test_date = Date.today + 5
    result = test_date.yday - Date.today.yday 
    expect(BirthdayCard.new("#{test_date}", 'Ogonna Okafor').days_till_birthday).to eq result
  end
  it 'will return false confirming the user birthday is not today for a past date' do
    test_date = Date.today - 5
    expect(BirthdayCard.new("#{test_date}", 'Ogonna Okafor').today?).to eq false
  end
  it ' will tell you how many days untill your birthday in a future year' do
    test_date = Date.today
    future_birthday = Date.today + 5
    result = future_birthday.yday - test_date.yday 
    expect(BirthdayCard.new("#{future_birthday}", 'Ogonna Okafor').days_till_birthday).to eq result
  end
end
