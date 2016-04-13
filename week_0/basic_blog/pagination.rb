# This module contains all the logic
# to paginate any collection (Array) of elements
# to use it:
#
# include Pagination            (add this to your class)
#
# @current_page                 (define this instance variable in your class)
# @elements_per_page            (define this instance variable in your class)
# @number_of_elements           (define this instance variable in your class)
#
# current_elements(collection)  (call this to get the elements of the current page)
# pagination                    (call this to display page numbers and let the
#                                user navigate forth and back)
#
# check how it is used in the Blog class with the collection @posts

module Pagination
  def last_page
    (@number_of_elements / @elements_per_page.to_f).ceil
  end

  # [x, y].min picks the smaller value
  # to ensure @current_page is never larger than last_page
  def next_page
    @current_page = [@current_page + 1, last_page].min
  end

  # [x, y].max picks the smaller value
  # to ensure @current_page is never lesser than 1
  def previous_page
    @current_page = [1, @current_page - 1].max
  end

  # the collection should be sorted when calling this method
  def current_elements(collection)
    first_element = (@current_page - 1) * @elements_per_page
    last_element = (@current_page * @elements_per_page) - 1

    collection[first_element..last_element]
  end

  def pagination
    (1..last_page).each do |page|
      print page == @current_page ? "[#{page}]" : page
      print " "
    end

    puts "\nprev - next\n\n"

    paginate
  end

  def paginate
    dir = gets.chomp.downcase

    if dir == "next" || dir == "n"
      next_page
    elsif dir == "prev" || dir == "p"
      previous_page
    else
      paginate
    end
  end
end
