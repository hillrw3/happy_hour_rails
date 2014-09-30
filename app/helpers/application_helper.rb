module ApplicationHelper

  def todays_specials

  end

  def find_day(record)
    day_of_week = Date.today.strftime('%A')
    @_day ||= case day_of_week
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

  def specials_status(record)
    unless record.special.starts_at == nil && record.special.ends_at == nil
      time_now = Time.parse("2000-01-01 #{Time.now.strftime('%H:%M:%S')} UTC")
      starts_at = record.special.starts_at.utc
      specials_range = starts_at..record.special.ends_at.utc
        if specials_range.cover?(time_now)
          "'marker-size': 'medium',
          'marker-color': '#4682b4',
          'marker-symbol': 'bar'"
        elsif (starts_at - (60 * 60)..starts_at).cover?(time_now)
          "'marker-size': 'medium',
          'marker-color': '#E6E612',
          'marker-symbol': 'bar'"
        else
          "'marker-size': 'small',
          'marker-color': '#C5C6C9'"
      end
    else
      "'marker-size': 'small',
      'marker-color': '#C5C6C9'"
    end
  end


end
