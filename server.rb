"rubygems
bundler/setup
mechanize
active_support
active_support/core_ext/string/filters
icalendar
sinatra
./public-ical.rb
".lines.map(&:strip).each &method(:require)

set :server, :puma

get '/public.ics' do
  response.headers['Content-type'] = 'text/calendar; charset=utf-8'
  PublicIcal::Calendar.new.icalendar.to_ical
end
