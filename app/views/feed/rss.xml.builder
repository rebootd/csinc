xml.instruct!

xml.rss "version" => "2.0", "xmlns:dc" => "http://purl.org/dc/elements/1.1/" do
 xml.channel do
   xml.title       "Computerist Solutions blog by Josh"
   xml.link        "#{@homeurl}/blog"
   xml.description "articles and code ramblings mostly by Josh"

   @posts.each do |post|
     next if post.published_on == nil
     xml.item do
       xml.title       post.title
       xml.link        "#{@homeurl}#{url_to_post(post)}"
       xml.description post.body
       xml.guid        "#{@homeurl}#{url_to_post(post)}"
     end
   end

 end
end

