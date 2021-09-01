require 'date'
require 'time'
require 'pg'

class BirthdayCard
  attr_reader :birthday, :name

  def initialize(birthday, name)
    @birthday = Date.parse(birthday).yday
    @name = name
    @todays_date = Date.today.yday
  end

  def self.all
    connection = PG.connect(dbname: 'birthdayapp')
    result = connection.exec("SELECT * FROM birthday_table;")
    result.map { |user| user['name'] }
  end

  def self.create(birthday_ID:, name:, birthday:)
    connection = PG.connect(dbname: 'birthdayapp')
    connection.exec("INSERT INTO birthday_table (birthday_ID, name, birthday) VALUES (DEFAULT, '#{name}', '#{birthday}')")
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

