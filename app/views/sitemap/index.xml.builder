xml.instruct! :xml, :version => '1.0'
xml.tag! 'urlset', 'xmlns' => "http://www.sitemaps.org/schemas/sitemap/0.9" do
  @urls.each do |url|
    xml.tag! 'url' do
      xml.tag! 'loc', url
    end
  end
end

