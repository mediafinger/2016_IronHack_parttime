require_relative "./pagination.rb"
require_relative "./post.rb"

class Blog
  include Pagination

  def initialize(posts = [], elements_per_page = 3)
    @posts = posts

    # the following 3 instance variables are used by
    # the Pagination module
    @number_of_elements = @posts.count
    @current_page = 1
    @elements_per_page = elements_per_page
  end

  def add_post(title, text, date = Time.now)
    @number_of_elements += 1
    @posts << Post.new(title, text, date)
  end

  def display_page
    sorted_posts = @posts.sort { |p1, p2| p2.date <=> p1.date }

    # current_elements is defined on the Pagination module
    current_elements(sorted_posts).each do |post|
      display(post)
    end

    # pagination is defined on the Pagination module
    pagination
    display_page
  end

  def display(post)
    puts # empty line
    post.sponsored? ? puts("******#{post.title}******") : puts(post.title)
    puts "**************"
    puts post.text
    puts "----------------"
    puts # empty line
  end
end
