class PublicIcal::Event < SimpleDelegator

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

  def ical_event
    Icalendar::Event.new.tap do |e|
      e.summary = title
      e.dtstart = date
      e.dtend = end_date
      e.location = location
    end
  end

  private

  def date_text
    search('.date').text.squish.downcase
  end

  def end_date_text
    search('.end-date span span').text.squish.downcase
  end
end
