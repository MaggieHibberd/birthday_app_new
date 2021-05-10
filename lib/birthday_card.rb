require 'date'

class Birthday_Card

  attr_reader :birthday, :name

  def initialize(birthday, name)
    @birthday = birthday
    @name = name
  end

  def confirmation?
    # date_obj = Date.strptime(@birthday, '%d/%m')

    # date_obj == Time.now.strftime('%d/%m')

    Time.parse(birthday).strftime('%d/%m') == Time.now.strftime('%d/%m')
   
  end
end
