class StateSeasonViewObject
  attr_reader :state, :ingredients

  def initialize(state, ingredients)
    @state = state
    @ingredients = ingredients
  end

  def display_title
    "#{Time.now.strftime("%B")} in #{state.name.gsub('-',' ')}"
  end

  def list_ingredients
    ingredients.map do |ingredient|
      ingredient.name
    end.join(' | ')
  end

end