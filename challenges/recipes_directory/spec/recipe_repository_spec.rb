require "recipe_repository"
require "recipe"

def reset_recipes_table
    seed_sql = File.read('spec/seeds_recipes.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'recipes_directory_test' })
    connection.exec(seed_sql)
end

RSpec.describe RecipeRepository do
    before(:each) do 
        reset_recipes_table
    end
    it "gets all recipes" do
        repo = RecipeRepository.new
        recipe = repo.all

        expect(recipe.length).to eq 3
        expect(recipe[0].id).to eq '1'
        expect(recipe[0].name).to eq 'Spanish chicken'
        expect(recipe[0].cooking_time).to eq '60'
        expect(recipe[0].rating).to eq '3'

        expect(recipe[2].id).to eq '3'
        expect(recipe[2].name).to eq 'Lamb chops'
        expect(recipe[2].cooking_time).to eq '20'
        expect(recipe[2].rating).to eq '5'
    end
    it "gets a single recipe" do
        repo = RecipeRepository.new
        recipe = repo.find(2)

        expect(recipe.id).to eq '2'
        expect(recipe.name).to eq 'Pork soulvaki'
        expect(recipe.cooking_time).to eq '30'
        expect(recipe.rating).to eq '4'
    end
end