require 'date'
require 'time'

class BirthdayCard
  attr_reader :birthday, :name

  def initialize(birthday, name)
    @birthday = Date.parse(birthday).yday
    @name = name
    @todays_date = Date.today.yday
  end

  def today?
    @birthday == @todays_date 
  end

  def days_till_birthday
    if @birthday > @todays_date
      @birthday - @todays_date 
    elsif @birthday < @todays_date
      new_birthday = @birthday + 365
      new_birthday - @todays_date
    end
  end 
end 

