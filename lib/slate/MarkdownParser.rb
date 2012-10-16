class MarkdownParser
  def initialize(attribute)
    @attribute = attribute
  end

  def before_save(record)
    markdown = Kramdown::Document.new(record.send("#{@attribute}")).to_html
    record.send("#{@attribute}=", markdown)
  end

  def self.html_to_markdown(text)
    Kramdown::Document.new(text, :input => 'html').to_kramdown
  end
end