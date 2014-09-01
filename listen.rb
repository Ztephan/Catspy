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

  	filename_full = added.to_s
	filename = filename_full.split('images/').last.split('"').first
   	filename = filename.to_s
  	fileaddress = "images/" + filename
  	puts fileaddress
    pagecreator(filename)
#    File.open("index.html", "r+") do |file|
#      doc = Nokogiri::HTML(file)
#      file.rewind
#      body = doc.at_css "body" # Finner body, og setter inn en ny div først
#      new_div = Nokogiri::XML::Node.new 'div id="box"', doc
#      new_link = Nokogiri::XML::Node.new 'a href="images/' + filename + '"\'', doc 
#      new_link.content = filename
#      new_div.add_child(new_link)
#      body.first_element_child.before(new_div)
#      file.write(doc.to_html)
    end
  end



 
listener.start # not blocking
sleep
