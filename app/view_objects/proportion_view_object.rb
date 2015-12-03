class ProportionViewObject
  attr_reader :proportion, :ingredient, :original_quantity

  def initialize(proportion)
    @proportion = proportion
    @ingredient = @proportion.ingredient.name
    @original_quantity = @proportion.quantity
  end

  def unit
    if proportion.unit
      @unit = proportion.unit.name
    else
      @unit = ""
    end
  end

  def quantity_conversion(quantity)
    conversions = { 0.125 => "1/8", 0.25 => "1/4", 0.333 => "1/3", 0.667 => "2/3", 0.5 => "1/2", 0.75 => "3/4" }
    if quantity.to_i == quantity
      quantity.to_i
    elsif conversions.keys.include?(quantity)
      conversions[quantity]
    elsif quantity
      quantity.round(3)
    end   
  end



  def quantity
    quantity_conversion(original_quantity)
  end

  def display
    "#{quantity} #{unit} #{ingredient}"
  end
end