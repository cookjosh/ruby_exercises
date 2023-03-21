require 'csv'
require 'google/apis/civicinfo_v2'
require 'erb'

def clean_zipcode(zipcode)
  zipcode.to_s.rjust(5,"0")[0..4]
end

def clean_phone_number(phone_number)
  phone_number.to_s.delete!(' ()-')
  if phone_number.length < 10 || phone_number.length > 11
    p 'Bad number.'
  elsif phone_number.length == 11 && phone_number[0] != 1
    p 'Bad number.'
  elsif phone_number.length == 11 && phone_number[0] == 1
    phone_number = phone_number[1..-1]
  end
end

def legislators_by_zipcode(zip)
  civic_info = Google::Apis::CivicinfoV2::CivicInfoService.new
  civic_info.key = 'AIzaSyClRzDqDh5MsXwnCWi0kOiiBivP6JsSyBw'

  begin
    civic_info.representative_info_by_address(
      address: zip,
      levels: 'country',
      roles: ['legislatorUpperBody', 'legislatorLowerBody']
    ).officials
  rescue
    'You can find your representatives by visiting www.commoncause.org/take-action/find-elected-officials'
  end
end

def save_thank_you_letter(id,form_letter)
  Dir.mkdir('output') unless Dir.exist?('output')

  filename = "output/thanks_#{id}.html"

  File.open(filename, 'w') do |file|
    file.puts form_letter
  end
end

def clean_date_time(registration_info)
  date_format = '%m/%d/%y'
  registration_array = registration_info.split
  registration_date = Date.strptime(registration_array[0], date_format).to_s
  registration_time = registration_array[1]
  registration_array = [registration_date, registration_time]
  return registration_array
end

def max_registrations(registration_information)
  hour_array = []
  day_array = []
  registration_information.each do |date_time_stamp|
    time_obj = Time.parse(date_time_stamp[1])
    date_obj = Date.strptime(date_time_stamp[0])
    day_array.push(date_obj.wday)
    hour_array.push(time_obj.hour)
  end
  max_hour = hour_array.max_by {|i| hour_array.count(i)}
  max_day = day_array.max_by {|i| day_array.count(i)}
  p "The most frequent time for registrations is #{max_hour}:00"
  p "The most frequent day for registrations is the #{max_day + 1}th day of the week!"
end

puts 'EventManager initialized.'

contents = CSV.open(
  'event_attendees.csv',
  headers: true,
  header_converters: :symbol
)

template_letter = File.read('form_letter.erb')
erb_template = ERB.new template_letter

registration_information = []

contents.each do |row|
  id = row[0]
  name = row[:first_name]
  zipcode = clean_zipcode(row[:zipcode])
  phone_number = clean_phone_number(row[:homephone])
  legislators = legislators_by_zipcode(zipcode)
  registration_information.push(clean_date_time(row[:regdate]))

  form_letter = erb_template.result(binding)

  save_thank_you_letter(id,form_letter)
end

max_registrations(registration_information)