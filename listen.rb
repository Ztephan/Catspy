require 'listen'
require 'nokogiri'
current_directory = Dir.pwd

listener = Listen.to(current_directory) do |modified, added, removed|
  puts "modified absolute path: #{modified}"
  puts "added absolute path: #{added}"
  puts "removed absolute path: #{removed}"
  	if added.empty? == false
		file = File.open("test2.html")
		doc = Nokogiri::HTML(file)

		body = doc.at_css "body"   # Finner body, og setter inn en ny div først
		new_div = Nokogiri::XML::Node.new 'div id="box"' , doc
		body.first_element_child.before(new_div)
		File.open("test2.html", "w") {|file| file.write(doc)}

		fil = File.open("test2.html")  # Laster filen på nytt, for å med den nye diven
		doc = Nokogiri::HTML(fil)

		div_to_change = doc.at_css 'div'  # Setter inn a href inni den første (den nye) diven
		new_link = Nokogiri::XML::Node.new 'a href="http://www.freak.no"', doc
		new_link.content = added
		div_to_change.add_child(new_link)

		File.open("test2.html", "w") {|file| file.write(doc.to_html)}	
	end
end

listener.start # not blocking
sleep



