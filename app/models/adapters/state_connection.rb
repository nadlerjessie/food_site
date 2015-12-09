require 'pry'
require 'open-uri'

module Adapters
  class StateConnection

    def page_navigation
      states = State.all
      states.each do |state|
        url = ("http://www.simplesteps.org/eat-local/state/#{state.name}")
        html = Nokogiri::HTML(open(url))
        create_ingredient_states(html, state)
      end
    end

    def create_ingredient_states(html, state)
      html.css('.season').each do |season_section|
        season_name = season_section.css('h3').text
        season = get_season(season_name)
        season_section.css('a').each do |ingredient|
         ingredient_name = ingredient.text
         ingredient = get_ingredient(ingredient_name)
         IngredientState.create(state_id: state.id, ingredient_id: ingredient.id, season_id: season.id)
        end
      end
    end

    def get_season(name)
      Season.find_by(name: name.upcase)
    end

    def get_ingredient(name)
      Ingredient.find_or_create_by(name: name)
    end

  end
end
