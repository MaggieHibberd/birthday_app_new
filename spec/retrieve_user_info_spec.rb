describe '.all' do
    it 'returns a list of user details' do
      birthday_card = BirthdayCard.all
      expect(birthday_card).to include "Gaara"
    end
    
  end