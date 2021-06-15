require 'date'
require 'time'

class BirthdayCard
  attr_reader :birthday, :name

  def initialize(birthday, name)
    @birthday = birthday
    @name = name
    @birthdate_reversed = @birthday.split('/').reverse.join('/')
    @user_birthdy = Time.parse(@birthdate_reversed).strftime('%d/%m/%Y')
  end

  def confirmation?
    Time.parse(@birthdate_reversed).strftime('%d/%m/%Y') ==
    Time.now.strftime('%d/%m/%Y')
  end

  def days_till_birthday
    future_year = (Time.now + 365 * 86400).strftime('%Y') 
    today_date = Time.now.strftime('%d/%m/%Y')
    if @user_birthdy < today_date
      new_birthday = birthday[0...6] + future_year
      Date.parse(new_birthday).mjd - Date.parse(today_date).mjd
    elsif @user_birthdy > today_date
      Date.parse(@user_birthdy).mjd - Date.parse(today_date).mjd
    end
  end
end
