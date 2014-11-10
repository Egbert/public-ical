"rubygems
bundler/setup
mechanize
active_support
active_support/core_ext/string/filters
icalendar
sinatra
./public-ical.rb
".lines.map(&:strip).each &method(:require)

get '/public.ics' do
  response.headers['Content-type'] = 'text/calendar; charset=utf-8'
  PublicIcal::Calendar.new.icalendar.to_ical
end

get '/' do
  <<HTML
  <html>
    <body style='margin: 0'>
      <iframe src="https://www.google.com/calendar/embed?src=v4smchckfuqjuuu62oouvddonn9k27v0%40import.calendar.google.com&ctz=Europe/Rome" style="border: 0" width="100%" height="100%" frameborder="0" scrolling="no"></iframe>
    </body>
  </html>
HTML
end

