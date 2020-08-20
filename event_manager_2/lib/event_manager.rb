require "csv"
require "google/apis/civicinfo_v2"
require "erb"
require 'time'
template_letter = File.read "../form_letter.erb"
erb_template = ERB.new template_letter

# clean zipcodes
def rinse_zip(zipcode)
    zipcode.to_s.rjust(5, "0")[0..4]
end

# get legislators by zipcodes
def legislators_by_zipcodes(zip)
    civic_info = Google::Apis::CivicinfoV2::CivicInfoService.new
    civic_info.key = 'AIzaSyAc3qmWzfZE3nzVduJa6d89XpU2I7w6ROI'

    begin 
        civic_info.representative_info_by_address(
            address: zip,
            levels: 'country',
            roles: ['legislatorUpperBody', 'legislatorLowerBody']
        ).officials
    rescue
        "You can find your representatives by visiting www.commoncause.org/take-action/find-elected-officials"
    end
end

# save thankyou letters to files
def save_thankyou_letter(id, form_letter)
    Dir.mkdir("output") unless Dir.exists? "output"
    
    filename = "output/thanks_#{id}.html"

    
    File.open(filename, 'w') do |file|
        file.puts form_letter
    end
end

# rinse phone numbers to correct format also parse bad numbers 
def rinse_phone(phone_number)

    phone_number = phone_number.gsub(/[!-.() ]/, "")

    if phone_number.length < 10
        return "invalid phone number"
    elsif phone_number.length == 10
        return phone_number
    elsif phone_number.length == 11 && phone_number[0] == 1
        return phone_number[1..10]
    elsif phone_number.length == 11 && phone_number[0] != 1
        return "invalid phone number"
    elsif phone_number.length > 11
        return "invalid phone number"
    end
end


# create time objects from time strings parsed 
def create_time_obj(time_reg, times)
    date = time_reg[0].split('/').map{ |input| input.rjust(2,'0')}.join('')
    time = time_reg[1].gsub!(':',"")
    time_object = DateTime.strptime("#{date}#{time}", '%m%d%y%H%M')
    
end

# calculate peak hour of signup
def calculate_peak_hours(time_object, times)
    !times[time_object.hour]? times[time_object.hour] = 1 : times[time_object.hour] += 1
    print times.sort_by { |k, v| v}
end

# calculate peak day of signup
def calculate_peak_days(time_object, days)
    !days[time_object.wday]? days[time_object.wday] = 1 : days[time_object.wday] += 1
    print days.sort_by { |k, v| v}
end





puts "EventManager Initialized"
puts "////////////////////////"


contents = CSV.open "../event_attendees.csv", headers: true, header_converters: :symbol

times = Hash.new
days = Hash.new
# run for each of the rows in the attendees
contents.each do |row|
    id = row[0]
    name = row[:first_name]
    zipcode = rinse_zip(row[:zipcode])
    homephone = rinse_phone(row[:homephone].to_s)
    time_reg = create_time_obj(row[:regdate].split(" "), times)
    legislators = legislators_by_zipcodes(zipcode)
    form_letter = erb_template.result(binding)
    
    # puts calculate_peak_hours(time_reg, times)
    # puts calculate_peak_days(time_reg, days)
    # save_thankyou_letter(id, form_letter)
end

