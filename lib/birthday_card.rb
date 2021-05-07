require 'date'

class Birthday_Card
  def confirmation(date)
    true
    current_date = Date.strptime(date, ‘%d/%m/%y’)
  end
endrd