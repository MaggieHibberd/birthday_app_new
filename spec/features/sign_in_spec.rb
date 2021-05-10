feature 'entering details' do
    scenario 'User goes to index page and sees a greeting' do
      visit('/')
      expect(page).to have_content 'Welcome friends!'
    end 

    scenario 'a user can text on the greetings page' do
      visit('/')
      fill_in :name, with: 'Ogonna Okafor'
      fill_in :birthday, with: '10/05/1970'
      click_button 'Submit'
      expect(page).to have_content "Hello Ogonna Okafor"
    end
  end
