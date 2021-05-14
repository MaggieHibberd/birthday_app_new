feature 'It is the users birthday and they see a message' do
  scenario 'User sees Happy birthday message after entering in details' do
      visit('/')
      fill_in :name, with: 'Ogonna Okafor'
      fill_in :birthday, with: '14/05/1970'
      click_button 'Submit'
      expect(page).to have_content 'Hello Ogonna Okafor'
  end 
end

