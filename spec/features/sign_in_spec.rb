feature 'entering details' do
    scenario 'User goes to index page and sees a greeting' do
      visit('/')
      expect(page).to have_content 'Welcome friends!'
    end

    scenario 'a user can text on the greetings page' do
      todays_date = Time.now.strftime('%d/%m/%Y')
      visit('/')
      fill_in :name, with: 'Ogonna Okafor'
      fill_in :birthday, with: "#{todays_date}"
      click_button 'Submit'
      expect(page).to have_content "Hello Ogonna Okafor"
    end
  end
