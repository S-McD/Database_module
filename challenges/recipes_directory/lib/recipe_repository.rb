class RecipeRepository
    def all
        sql = 'SELECT id, name, cooking_time, rating FROM recipes;'
        record_set = DatabaseConnection.exec_params(sql, [])
        cookbook = []

        record_set.each { |record| 
        recipe = Recipe.new
        recipe.id = record['id']
        recipe.name = record['name']
        recipe.cooking_time = record['cooking_time']
        recipe.rating = record['rating']
        cookbook << recipe}
        return cookbook
    end
    def find(id)
        sql = 'SELECT id, name, cooking_time, rating FROM recipes WHERE id = $1;'
        sql_params = [id]
        record_set = DatabaseConnection.exec_params(sql, sql_params)

        record = record_set[0]
        recipe = Recipe.new
        recipe.id = record['id']
        recipe.name = record['name']
        recipe.cooking_time = record['cooking_time']
        recipe.rating = record['rating']
        return recipe
    end
end