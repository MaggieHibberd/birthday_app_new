require 'date'

class Birthday_Card
  def confirmation(date)
    date_obj = Date.strptime(date,'%d/%m/%Y')
    date_obj == Date.today
  end
end