require 'pry'
require 'mechanize'

module Adapters
  class FoodNetworkLinks 

# links AtrhoughW
# "http://www.foodnetwork.com/recipes/a-z.A.1.html"


# 123
# "http://www.foodnetwork.com/recipes/a-z.123.1.html"


# XYZ
# "http://www.foodnetwork.com/recipes/a-z.XYZ.1.html"

    def page_navigation
      mechanize = Mechanize.new
      new_links = a_through_w.map do |letter|
        (1..2).map do |num|
          page = mechanize.get("http://www.foodnetwork.com/recipes/a-z.#{letter.upcase}.#{num}.html")
          page.links_with(:href => /^\/recipes\/?/).map { |link| link.href }
        end
      end
      new_links.flatten.uniq.delete_if{|link| link.include?('a-z') || link.include?('/recipes.html') || link.include?('/recipes/photos/')}
    end

    def a_through_w
      'A'.upto('B').to_a
    end

  end
end


