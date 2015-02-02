class PublicIcal::Event < SimpleDelegator

  def ical_event
    Icalendar::Event.new.tap do |e|
      e.summary = title
      e.dtstart = date
      e.dtstart.ical_params = { VALUE: "DATE" }
      e.dtend = end_date
      e.dtend.ical_params = { VALUE: "DATE" }
      e.location = location
    end
  end

  private

  def title
    search('.info a').first.text
  end

  def location
    search('.info a').last.text
  end

  def date
    PublicIcal::Date.new(date_text).date
  end

  def end_date
    PublicIcal::Date.new(end_date_text).date || date + 1.day
  end

  def date_text
    search('.date .normal').text.squish.downcase
  end

  def end_date_text
    search('.end-date span span').text.squish.downcase
  end

end
