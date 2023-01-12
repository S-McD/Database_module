require_relative "lib/database_connection"
require_relative "lib/recipe"
require_relative "lib/recipe_repository"

DatabaseConnection.connect('recipes_directory_test')

recipe_repository = RecipeRepository.new

recipe_repository.all.each do |recipe| 
    p recipe end