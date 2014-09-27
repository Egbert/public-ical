module PublicIcal
end

"./public-ical/date
./public-ical/event
./public-ical/calendar
".lines.map(&:strip).each &method(:require)
