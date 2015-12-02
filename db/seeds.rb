# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.destroy_all
Category.destroy_all
Ingredient.destroy_all
Proportion.destroy_all
Recipe.destroy_all
Step.destroy_all
Unit.destroy_all
Favorite.destroy_all

#######################
users = User.create([{name: 'Jeffers', email: 'clevergirl@jurassicpark.gov', password_digest: 'password'},
                    {name: 'Allegria', email: 'fluffy@flatironschool.com', password_digest: 'fruitfly'}
                  ])

#######################
categories = Category.create([{name: 'dinner'}, {name: 'breakfast'},{name: 'lunch'}, {name: 'gluten-free'}, {name: 'mexican'}, {name: 'thanksgiving'}])


#######################
gumbo = Recipe.create(name: 'Chicken and Gumbo' , view_count: 0, user_id: User.all[0], image_url: 'http://www.simplecomfortfood.com/wp-content/uploads/2012/10/chicken-gumbo-recipe-high.jpg')
gumbo.categories = [categories[0]]

ingredient1 = Ingredient.create(name: 'large boneless skinless chicken breast halves')
proportion1 = Proportion.create([unit_id: nil, ingredient_id: ingredient1.id, quantity:3, recipe_id: gumbo.id])

ingredient2 = Ingredient.create(name: 'Salt and pepper')
proportion2 = Proportion.create([unit_id: nil, ingredient_id: ingredient2.id, quantity: nil, recipe_id: gumbo.id])

ingredient3 = Ingredient.create(name: 'vegetable oil')
unit3       = Unit.create(name: 'cup')
proportion3 = Proportion.create([unit_id: unit3.id, ingredient_id: ingredient3.id, quantity: 0.25, recipe_id: gumbo.id])

ingredient4 = Ingredient.create(name: 'all-purpose flour')
unit4       = Unit.create(name: 'cup')
proportion4 = Proportion.create([unit_id: unit4.id,  ingredient_id: ingredient4.id, quantity: 0.25, recipe_id: gumbo.id])

ingredient5 = Ingredient.create(name: 'margarine')
unit5       = Unit.create(name: 'tablespoons')
proportion5 = Proportion.create([unit_id: unit5.id, ingredient_id: ingredient5.id, quantity: 5, recipe_id: gumbo.id])

ingredient6 = Ingredient.create(name: 'large onion, chopped')
proportion6 = Proportion.create([unit_id: nil, ingredient_id: ingredient6.id, quantity: 1, recipe_id: gumbo.id])

ingredient7 = Ingredient.create(name: 'green bell pepper, seeded and chopped')
proportion7 = Proportion.create([unit_id: nil, ingredient_id: ingredient7.id, quantity: 1, recipe_id: gumbo.id])

ingredient8 = Ingredient.create(name: 'stalks celery chopped')
proportion8 = Proportion.create([unit_id: nil, ingredient_id: ingredient8.id, quantity: 3, recipe_id: gumbo.id])

ingredient9 = Ingredient.create(name: 'Worcestershire sauce')
unit9       = Unit.create(name: 'cup')
proportion9 = Proportion.create([unit_id: unit9.id, ingredient_id: ingredient9.id, quantity: 0.25, recipe_id: gumbo.id])

ingredient10 = Ingredient.create(name: 'flat leaf parsley, stems and leaves, coarsely chopped, plus chopped leaves for garnish')
unit10       = Unit.create(name: 'bunch')
proportion10 = Proportion.create([unit_id: unit10.id, ingredient_id: ingredient10.id, quantity: 0.25, recipe_id: gumbo.id])

ingredient11 = Ingredient.create(name: 'hot water')
unit11       = Unit.create(name: 'cups')
proportion11 = Proportion.create([unit_id: unit11.id, ingredient_id: ingredient11.id, quantity: 4, recipe_id: gumbo.id])

ingredient12 = Ingredient.create(name: 'beef bouillon cubes')
proportion12 = Proportion.create([unit_id: nil, ingredient_id: ingredient12.id, quantity: 5, recipe_id: gumbo.id])

ingredient13 = Ingredient.create(name: '(14-ounce can) stewed tomatoes with juice')
proportion13 = Proportion.create([unit_id: nil, ingredient_id: ingredient13.id, quantity: 1, recipe_id: gumbo.id])

ingredient14 = Ingredient.create(name: 'frozen sliced okra')
unit14       = Unit.create(name: 'cups')
proportion14 = Proportion.create([unit_id: unit14.id, ingredient_id: ingredient14.id, quantity: 2, recipe_id: gumbo.id])


ingredient15 = Ingredient.create(name: 'green onions, sliced, white and green parts')
proportion15 = Proportion.create([unit_id: nil, ingredient_id: ingredient15.id, quantity: 4, recipe_id: gumbo.id])

ingredient16 = Ingredient.create(name: 'cloves garlic minced')
proportion16 = Proportion.create([unit_id: nil, ingredient_id: ingredient16.id, quantity: 8, recipe_id: gumbo.id])

ingredient17 = Ingredient.create(name: 'small shrimp, peeled, deveined and cooked')
unit17       = Unit.create(name: 'pounds')
proportion17 = Proportion.create([unit_id: unit17.id, ingredient_id: ingredient17.id, quantity: 0.5, recipe_id: gumbo.id])

ingredient18 = Ingredient.create(name: 'smoked sausage, cut into 1/4-inch slices')
unit18       = Unit.create(name: 'pound')
proportion18 = Proportion.create([unit_id: unit18.id, ingredient_id: ingredient18.id, quantity:1, recipe_id: gumbo.id]) 

step1 = Step.create(description: 'Season the chicken with salt and pepper.', recipe_id: gumbo.id)
step2 = Step.create(description: 'Heat the oil in a heavy bottomed Dutch oven over medium-high heat. Cook the chicken until browned on both sides and remove.', recipe_id: gumbo.id)
step4 = Step.create(description: 'Add the sausage and cook until browned, then remove.', recipe_id: gumbo.id)
step5 = Step.create(description: 'Sprinkle the flour over the oil, add 2 tablespoons of margarine and cook over medium heat, stirring constantly, until brown, about 10 minutes. Let the roux cool.', recipe_id: gumbo.id)
step6 = Step.create(description: 'Return the Dutch oven to low heat and melt the remaining 3 tablespoons margarine. Add the onion, garlic, green pepper and celery and cook for 10 minutes.', recipe_id: gumbo.id)
step7 = Step.create(description: 'Add Worcestershire sauce, salt and pepper, to taste and the 1/4 bunch parsley. Cook, while stirring frequently, for 10 minutes.', recipe_id: gumbo.id)
step8 = Step.create(description: 'Add 4 cups hot water and bouillon cubes, whisking constantly.', recipe_id: gumbo.id)
step9 = Step.create(description: 'Add the chicken and sausage. Bring to a boil, then reduce the heat, cover, and simmer for 45 minutes.', recipe_id: gumbo.id)
step10 = Step.create(description: 'Add tomatoes and okra. Cover and simmer for 1 hour.', recipe_id: gumbo.id)
step11 = Step.create(description: 'Just before serving add the green onions, shrimp and chopped parsley.', recipe_id: gumbo.id)

#######################


omelet = Recipe.create(name: 'shrimp and avocado omelet', view_count: 0, user_id: User.all[1], image_url: 'http://farm3.static.flickr.com/2765/4165912035_70e5e7c364.jpg')
omelet.categories = [categories[1]]


ingredient20 = Ingredient.create(name: 'ripe tomato, diced')
proportion20 = Proportion.create([unit_id: nil, ingredient_id: ingredient20.id, quantity: 0.25, recipe_id: omelet.id]) 

ingredient21 = Ingredient.create(name: 'ripe avocado, diced')
proportion21 = Proportion.create([unit_id: nil, ingredient_id: ingredient21.id, quantity: 0.25, recipe_id: omelet.id]) 

ingredient22 = Ingredient.create(name: 'chopped fresh cilantro, (optional)')
unit22       = Unit.create(name: 'tablespoon')
proportion22 = Proportion.create([unit_id: unit22.id, ingredient_id: ingredient22.id, quantity: 1, recipe_id: omelet.id]) 

ingredient23 = Ingredient.create(name: 'sea salt')
unit23       = Unit.create(name: 'teaspoon')
proportion23 = Proportion.create([unit_id: unit23.id, ingredient_id: ingredient23.id, quantity: 0.125, recipe_id: omelet.id]) 

ingredient24 = Ingredient.create(name: 'Freshly ground black pepper')
proportion24 = Proportion.create([unit_id: nil, ingredient_id: ingredient24.id, quantity: nil, recipe_id: omelet.id]) 


ingredient25 = Ingredient.create(name: 'eggs')
proportion25 = Proportion.create([unit_id: nil, ingredient_id: ingredient25.id, quantity: 2, recipe_id: omelet.id]) 

ingredient26 = Ingredient.create(name: 'butter')
unit26       = Unit.create(name: 'tablespoon')
proportion26 = Proportion.create([unit_id: unit26.id, ingredient_id: ingredient26.id, quantity: 1, recipe_id: omelet.id]) 

ingredient27 = Ingredient.create(name: 'cooked shrimp, chopped roughly')
proportion27 = Proportion.create([unit_id: nil, ingredient_id: ingredient27.id, quantity: 3, recipe_id: omelet.id]) 

ingredient28 = Ingredient.create(name: 'grated cheese (medium cheddar or Monterey jack)')
unit28       = Unit.create(name: 'cup')
proportion28 = Proportion.create([unit_id: unit28.id, ingredient_id: ingredient28.id, quantity: 0.33, recipe_id: omelet.id]) 

step20 = Step.create(description: 'Toss tomato, avocado and cilantro together in a small bowl. Season to taste with salt and pepper. Set aside.', recipe_id: omelet.id)
step21 = Step.create(description: 'Beat eggs in a separate small bowl just until whites and yolks are combined, not long enough to become frothy.', recipe_id: omelet.id)
step22 = Step.create(description: 'Over medium-high heat, melt butter in a 6- or 8-inch skillet (preferably slope-sided and non-stick) until bubbling but not brown. Tilt skillet to spread butter evenly around and up sides.', recipe_id: omelet.id)
step23 = Step.create(description: 'Pour eggs into the hot skillet, tilting and shaking the pan gently with one hand while stirring eggs briskly with the flat of a fork. Tilt pan and lift edges of omelet with a fork to allow runny egg to reach sides and cook. When eggs begin to firm up and there is almost no runny egg left, add shrimp and cheese, spreading them over the center third of the omelet. Immediately use the fork to fold each side of omelet up over center filling. Tilt the pan to help roll omelet into a loose cylinder. Cook 10 to 30 seconds longer, depending on how brown you prefer the bottom (check for brownness by lifting a corner). Slide omelet onto a warmed plate, top with tomato-avocado mixture and serve.', recipe_id: omelet.id)









