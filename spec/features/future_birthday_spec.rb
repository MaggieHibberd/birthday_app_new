feature "it is not the user's birthday" do
  scenario 'the user inputs their birthday and it takes them to the /futures page' do
    visit('/')
    fill_in :name, with: 'Ogonna Okafor'
    fill_in :birthday, with: '01/01/1970'
    click_button 'Submit'
    expect(page).to have_content 'Your birthday is in X number of days'
  end
end