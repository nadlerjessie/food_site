class ProportionViewObject
  attr_reader :proportion, :ingredient, :unit, :quantity

  def initialize(proportion)
    @proportion = proportion
    @ingredient = @proportion.ingredient.name
    @quantity = @proportion.quantity
    format_quantity
    format_unit
  end

  def format_unit
    if proportion.unit
      @unit = proportion.unit.name
    else
      @unit = ""
    end
  end

  def quantity_conversion
    { 0.125 => "1/8",
      0.25 => "1/4",
      0.333 => "1/3",
      0.667 => "2/3",
      0.5 => "1/2",
      0.75 => "3/4" }
  end



  def format_quantity
    conversions = quantity_conversion
    if quantity.to_i == quantity
      @formatted_quantity = quantity.to_i
    elsif conversions.keys.include?(quantity)
      @formatted_quantity = conversions[quantity]
    end
  end

  def display
    "#{@formatted_quantity} #{unit} #{ingredient}"
  end
end