require 'date'

class Birthday_Card

  attr_reader :birthday, :name

  def initialize(birthday, name)
    @birthday = birthday
    @name = name
  end

  def confirmation?
    Time.parse(birthday).strftime('%d/%m') == Time.now.strftime('%d/%m')   
  end
end
