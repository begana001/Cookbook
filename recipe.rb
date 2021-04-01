class Recipe
  attr_reader :name, :description, :rating

  # change datatype then we can put default value for done
  def initialize(attributes = {})
    @name = attributes[:name]
    @description = attributes[:description]
    @rating = attributes[:rating]
    @done = attributes[:done] || false
  end

  # read status of done
  def done?
    @done
  end

  # change status of done to true
  def mark_as_done!
    @done = true
  end
end
