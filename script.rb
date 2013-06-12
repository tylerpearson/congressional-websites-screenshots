require "httparty"
require "fileutils"

class String
  def underscore
    self.gsub(/::/, '/').
    gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2').
    gsub(/([a-z\d])([A-Z])/,'\1_\2').
    tr("-", "_").
    tr(" ", "_").
    downcase
  end
end

response = HTTParty.get("http://congress.api.sunlightfoundation.com/legislators?per_page=all&apikey=9c1ebbe93f3c4e52827fe22270805466")

puts "Total: #{response['results'].length}"
puts "==============="

count = 0

response["results"].each_with_index do |member,index|

  puts "Member: #{index}"

  name = "#{member['last_name']} #{member['first_name']} _#{member['title']}".underscore
  state = "#{member['state_name']}".underscore
  url = "#{member['website']}"

  # go to next member if there isn't a url
  if url.length == 0
    next
  end

  puts "1. Looking at #{member['title']}. #{member['first_name']} #{member['last_name']} from #{member['state_name']}"

  if !(File.directory?("screenshots/#{state}"))
    puts "2. No directory for #{state} yet. Creating."
    FileUtils.mkdir("screenshots/#{state}")
  else
    puts "2. There is a directory for #{state} already. Moving on."
  end

  timestamp = Time.now.to_i
  filename = "#{name}_#{timestamp}"

  puts "3. Generating screenshot for #{url}"
  websiteoutput = `phantomjs screenshot.js #{url} #{state} #{filename}`

  puts "4. Created #{filename}.png"

  count += 1

  puts " "
  puts "=============="
  puts " "

end


puts " "
puts "====================="
puts "====================="
puts "FINISHED"
puts "#{count} screenshots created."