xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title (@blog.title) ? @blog.title : "Unnamed Blog"
    xml.description (@blog.description) ? @blog.description : ""
    xml.link posts_url

    for post in @posts
      xml.item do
        xml.title post.title
        xml.description @kramdown_parser.kramdown_to_html(post.body).html_safe
        xml.pubDate post.written_at.to_s(:rfc822)
        xml.link post_url(post)
        xml.guid post_url(post)
      end
    end
  end
end