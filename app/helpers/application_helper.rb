module ApplicationHelper

  def find_day(record)
    day_of_week = Date.today.strftime('%A')
    case day_of_week
      when "Sunday"
        record.special.sunday ? record.special.sunday : "Add something!"
      when "Monday"
        record.special.monday ? record.special.monday : "Add something!"
      when "Tuesday"
        record.special.tuesday ? record.special.tuesday : "Add something!"
      when "Wednesday"
        record.special.wednesday ? record.special.wednesday : "Add something!"
      when "Thursday"
        record.special.thursday ? record.special.thursday : "Add something!"
      when "Friday"
        record.special.friday ? record.special.friday : "Add something!"
      when "Saturday"
        record.special.saturday ? record.special.saturday : "Add something!"
    end
  end





end
