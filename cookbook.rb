require 'csv'

class Cookbook
  def initialize(csv_file_path)
    @cookbook = []
    @csv_file = csv_file_path
    open_csv
  end

  def all
    @cookbook
  end

  def add(recipe)
    @cookbook << recipe
    save_csv
  end

  def remove(index)
    @cookbook.delete_at(index)
    save_csv
  end

  # method for mark as done
  def mark_as_done(index)
    recipe = @cookbook[index - 1]
    recipe.mark_as_done!
    save_csv
  end

  private

  def save_csv
    CSV.open(@csv_file, 'wb')do |csv|
      csv << ["name", "description", "rating", "done"]
      @cookbook.each do |recipe|
        csv << [recipe.name, recipe.description, recipe.rating, recipe.done?]
      end
    end
  end

  def open_csv
    # change csv converter since we change it into symbol
    CSV.foreach(@csv_file, headers: :first_row, header_converters: :symbol) do |row|
      #here, row is an array of columns
      row[:done] = row[:done] == "true"
      @cookbook << Recipe.new(row)
    end

  end

end
