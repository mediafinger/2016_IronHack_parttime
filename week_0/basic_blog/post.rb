class Post
  attr_reader :title, :text, :date

  def initialize(title, text, date)
    @title = title
    @text = text
    @date = date
    @sponsored = false
  end

  def sponsor!
    @sponsored = true
  end

  def sponsored?
    @sponsored
  end
end
