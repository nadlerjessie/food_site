require 'open-uri'
module Adapters
  class FoodNetworkConnection
    attr_reader :connection

    def initialize
      @connection = self.class
    end

    def scrape(url)
      begin
        read_url = open(url)
        return Nokogiri::HTML(read_url)
      rescue OpenURI::HTTPError => e
        if e.message == '404 Not Found'
          nil
        end
      end
      # binding.pry
      # read_url = open(url)
      # recipe = Nokogiri::HTML(read_url)
    end

    def get_proportions(recipe)
      proprotions = recipe.css('.bd .ingredients').children.children.css('li').map {|proportion| proportion.text.split(" ")}
    end

    def get_steps(recipe)
      steps = recipe.css('.bd .directions').children.css('p').map {|step| step.text}
    end

    def get_categories(recipe)
      categories = recipe.css('.categories li').map {|category| category.text}
    end

    def get_name(recipe)
      recipe.css('.title h1').text
    end

    def get_image(recipe)
      if recipe.css('.single-photo-recipe a.ico-wrap img').any?
        recipe.css('.single-photo-recipe a.ico-wrap img').attr('src').value
      else
        "default_photo.jpg"
      end
    end

    def get_recipe(url)
      recipe = scrape(url)
      if recipe
        [get_name(recipe), get_proportions(recipe), get_steps(recipe), get_categories(recipe), get_image(recipe)]
      else
        nil
      end
    end
  end
end
