feature 'It is the users birthday and they see a message' do
  scenario 'User sees Happy birthday message after entering in details' do
    todays_date = Time.now.strftime('%d/%m/%Y')
    visit('/')
    fill_in :name, with: 'Ogonna Okafor'
    fill_in :birthday, with: todays_date
    click_button 'Submit'
    expect(page).to have_content 'Hello Ogonna Okafor'
  end 
end

