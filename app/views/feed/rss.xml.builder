xml.instruct!

xml.rss "version" => "2.0", "xmlns:dc" => "http://purl.org/dc/elements/1.1/" do
 xml.channel do
   xml.title       "Computerist Solutions blog by Josh"
   xml.link        "#{@homeurl}/blog"
   xml.description "articles and code ramblings mostly by Josh"

   @keys.each do |article|
     article = JSON.parse(article)
     xml.item do
       xml.title       article[:title]
       xml.link        "#{@homeurl}#{url_to_post(article)}"
       xml.description article[:title]
       xml.guid        "#{@homeurl}#{url_to_post(article)}"
     end
   end

 end
end

