class Book
  attr_reader :title
  
  def title=(name)
    @title = name.upcase!
  end
end

my_book = Book.new
p my_book.title = 'hopscotch' #outputs HOPSCOTCH