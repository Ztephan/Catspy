require 'listen'
require 'nokogiri'
require_relative 'pagecreator'
current_directory = Dir.pwd
listening_directory = current_directory + "/images"
 
listener = Listen.to(listening_directory) do |modified, added, removed|
  puts "modified absolute path: #{modified}"
  puts "added absolute path: #{added}"
  puts "removed absolute path: #{removed}"
 
  if added.empty? == false
    added.each do |adding|
    filename_full = adding.to_s
	  filename = filename_full.split('images/').last.split('"').first
    filename = filename.to_s
  	fileaddress = "images/" + filename
  	puts fileaddress
    pagecreator(filename)
    end
  end
end



 
listener.start # not blocking
sleep
