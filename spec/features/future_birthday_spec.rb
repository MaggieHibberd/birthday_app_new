feature "it is not the user's birthday" do
  scenario 'the user inputs their birthday and it takes them to the /futures page' do
    test_date = (Time.now + 5 * 86400).strftime('%d/%m/%Y')
    visit('/')
    fill_in :name, with: 'Ogonna Okafor'
    fill_in :birthday, with: test_date
    click_button 'Submit'
    expect(page).to have_content 'Your birthday is in 5 number of days'
  end
end
