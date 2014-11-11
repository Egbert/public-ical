"rubygems
bundler/setup
mechanize
active_support
active_support/core_ext/string/filters
icalendar
sinatra
github/markup
./public-ical.rb
".lines.map(&:strip).each &method(:require)

get '/public.ics' do
  response.headers['Content-type'] = 'text/calendar; charset=utf-8' unless params[:debug]
  PublicIcal::Calendar.new.icalendar.to_ical
end

get '/' do
  <<HTML
  <html>
    <body style='font-family: sans-serif'>
      #{GitHub::Markup.render 'README.md'}
      <iframe src="https://www.google.com/calendar/embed?src=v4smchckfuqjuuu62oouvddonn9k27v0%40import.calendar.google.com&ctz=Europe/Rome" style="border: 0" width="800" height="600" frameborder="0" scrolling="no"></iframe>
    </body>
  </html>
HTML
end

