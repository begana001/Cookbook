class Cookbook
  def initialize
    @cookbook = []
  end

  def all
    @cookbook
  end

  def add(recipe)
    @cookbook << recipe
  end

  def remove(index)
    @cookbook.delete_at(index)
  end
end
