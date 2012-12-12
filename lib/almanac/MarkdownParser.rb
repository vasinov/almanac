class MarkdownParser
  def initialize(*args)
    @attribute = *args[0]
  end

  def before_save(record)
    markdown = Kramdown::Document.new(record.send("#{@attribute}")).to_html
    record.send("#{@attribute}=", markdown)
  end

  def html_to_kramdown(text)
    Kramdown::Document.new(text.html_safe, :input => 'html').to_kramdown
  end

  def kramdown_to_html(text)
    Kramdown::Document.new(text.html_safe, :input => 'kramdown').to_html
  end
end