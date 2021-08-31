require 'date'
require 'time'

class BirthdayCard
  attr_reader :birthday, :name

  def initialize(birthday, name)
   @birthday = birthday
   @name = name
   @birthdate_reversed = @birthday.split('/').reverse.join('/')
  end

  def today?
    Time.parse(@birthdate_reversed).strftime('%d/%m/%Y')[0...6] ==
    Time.now.strftime('%d/%m/%Y')[0...6]
  end

  def days_till_birthday
    today_date = Time.now.strftime('%d/%m/%Y')
    birthday_this_year = @birthday[0...6] + today_date[6...10]
    new_birthday = @birthday[0...6] + (Time.now + 365 * 86400).strftime('%Y')
 
    if @birthday[3..4] >= today_date[3..4] && @birthday[0..1] >= today_date[0..1]
      Date.parse(birthday_this_year).mjd - Date.parse(today_date).mjd
    elsif @birthday[3..4] == today_date[3..4] && @birthday[0..1] < today_date[0..1] 
      Date.parse(new_birthday).mjd - Date.parse(today_date).mjd
    elsif @birthday[3..4] > today_date[3..4] && @birthday[0..1] < today_date[0..1]  
      Date.parse(birthday_this_year).mjd - Date.parse(today_date).mjd
    elsif @birthday[3..4] < today_date[3..4] && @birthday[0..1] <=> today_date[0..1]
      Date.parse(new_birthday).mjd - Date.parse(today_date).mjd
    end
  end 
end 

