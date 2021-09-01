feature 'Birthday app' do
scenario 'User information is entered into the database' do
    visit('/')
    BirthdayCard.create(birthday_ID: 0, name: 'gaz', birthday: '24/08/1999');
end
end
  