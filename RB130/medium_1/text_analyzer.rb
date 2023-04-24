class TextAnalyzer
  def process
    text = File.read('sample_text.txt')
    yield text
  end
end

analyzer = TextAnalyzer.new
analyzer.process { |text| puts "#{text.scan(/\R\R/).size + 1} paragraphs" }
analyzer.process { |text| puts "#{text.scan(/\R/).size + 1} lines" }
analyzer.process { |text| puts "#{text.scan(/\s/).size + 1} words" }