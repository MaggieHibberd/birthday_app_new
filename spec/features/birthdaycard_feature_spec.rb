feature 'Birthday app' do
    scenario 'User goes to index page and sees a greeting' do
      visit('/')
      expect(page).to have_content 'Welcome friends!'
    end

    scenario 'User inputs details and app tells the user how many days it is until their birthday' do
      test_date = Date.today + 5
      visit('/')
      fill_in :name, with: 'Ogonna Okafor'
      fill_in :birthday, with: test_date
      click_button 'Submit'
      expect(page).to have_content 'Ogonna Okafor your birthday is in 5 days'
    end

    scenario 'User inputs todays date and sees Happy birthday message' do
      todays_date = Date.today
      visit('/')
      fill_in :name, with: 'Ogonna Okafor'
      fill_in :birthday, with: todays_date
      click_button 'Submit'
      expect(page).to have_content 'Hello Ogonna Okafor'
    end

    scenario 'When the user enters an incorrect date format an flash message is shown' do
      visit('/')
      fill_in :name, with: 'Ogonna Okafor'
      fill_in :birthday, with: 'wwwww'
      click_button 'Submit'
      expect(page).to have_content '**!!PLEASE ENTER YOUR BIRTHDAY IN THE CORRECT FORMAT!!**'
      end
end
