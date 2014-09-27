class PublicIcal::Calendar
  def agent
    Mechanize.new
  end

  def page
    agent.get('http://wearepublic.nl/programma/')
  end

  def events
    page.search('.item').map &PublicIcal::Event.method(:new)
  end

  def icalendar
    Icalendar::Calendar.new.tap do |c|
      events.map(&:ical_event).each &c.method(:add_event)
    end
  end
end
