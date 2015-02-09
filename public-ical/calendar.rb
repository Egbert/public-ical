class PublicIcal::Calendar

  def icalendar
    Icalendar::Calendar.new.tap do |c|
      events.map(&:ical_event).compact.each &c.method(:add_event)
    end
  end

  private

  def agent
    Mechanize.new
  end

  def page
    agent.get('http://wearepublic.nl/programma/')
  end

  def events
    page.search('.item').map &PublicIcal::Event.method(:new)
  end

end
