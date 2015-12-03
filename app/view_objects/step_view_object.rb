class StepViewObject
  attr_reader :step

  def initialize(step)
    @step = step
  end

  def list(index)
    "Step #{index + 1}: #{step.description}"
  end
end