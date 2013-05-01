require "csv"
require "sunlight"
require 'erb'

Sunlight::Base.api_key = "e179a6973728c4dd3fb1204283aaccb5"


def clean_zipcode(zipcode)
	# if the zip code is exactly five digits, assume that it is ok
	# if the zipcode is more than 5 digits, truncate it to the first 5 digits
	# if the zipcode is less than 5 digits, add zeros to the front until it becomes 5 digits
	
	zipcode.to_s.rjust(5,"0")[0..4]
end

def clean_phoneno(phoneno)
	number = phoneno.digits

	if number.length == 10
		number
	elsif (number.length ==11) && (number[0] == "1")
		number[1..-1]
	else
		"number is invalid"
	end
end

def legislators_for_zipcode(zipcode)
	Sunlight::Legislator.all_in_zipcode(zipcode)
end

def save_thank_you_letters(id, form_letter)
	Dir.mkdir("output") unless Dir.exists? "output"

	filename = "output/thanks#{id}.html"

	File.open(filename, 'w') do |file|
		file.puts form_letter
	end
end
puts "EventManager Initialized!"

contents = CSV.open "event_attendees.csv", headers: true, header_converters: :symbol

template_letter = File.read "form_letter.erb"
erb_template = ERB.new template_letter

contents.each do |row|
	id =row[0]
	name = row[:first_name]
	zipcode = clean_zipcode(row[:zipcode])
	legislators = legislators_for_zipcode(zipcode)

	form_letter = erb_template.result(binding)
	
	save_thank_you_letters(id,form_letter)
end

# legislator_names = []
# legislators.each do |legislator|
# 	legislator_name = "#{legislator.first_name} #{legislator.lastname}"
# 	legislator_names << legislator_name
# end

# lines = File.readlines "event_attendees.csv"
# lines.each_with_index do |line,index|
#   next if index == 0
#   columns = line.split(",")
#   name = columns[2]
#   puts name
#   index
# end