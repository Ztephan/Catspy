require 'nokogiri'

def pagecreator(input)
	filename = input.to_s
	File.open("pages/pagetemplate.html", "r+") do |file|
      doc = Nokogiri::HTML(file)
      file.rewind
      body = doc.at_css "body" # Finner body, og setter inn en ny div først
      imagelink = "<a href=\"javascript:history.back()\"><img src=\"../images/#{filename}\" alt=\"Back to main page\"</a>"
      image = doc.parse(imagelink)
     #  Nokogiri::XML::Node.new image, doc
      body.add_child(image)

      filename_stripped = filename.split('.').first
      html_name = "pages/#{filename_stripped}.html"

      File.open(html_name, 'w') { |file| file.write(doc) }
  end
end

pagecreator("bilde2.jpg")
   