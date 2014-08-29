require 'nokogiri'

file = File.open("test2.html")
doc = Nokogiri::HTML(file)


div = doc.xpath("//div").each do |div|
div.content = "AW YISS!!"
end

body = doc.at_css "body"
new_div = Nokogiri::XML::Node.new 'div id="box"' , doc
body.first_element_child.before(new_div)
File.open("test2.html", "w") {|file| file.write(doc)}

fil = File.open("test2.html")
doc = Nokogiri::HTML(fil)

div_to_change = doc.at_css 'div'
new_link = Nokogiri::XML::Node.new 'a href="http://www.freak.no"', doc
new_link.content = 'TEST'
div_to_change.add_child(new_link)


File.open("test2.html", "w") {|file| file.write(doc.to_html)}