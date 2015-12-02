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
gumbo = Recipe.create(name: 'Chicken and Gumbo' , view_count: 0, user_id: User.all.first, image_url: 'http://www.simplecomfortfood.com/wp-content/uploads/2012/10/chicken-gumbo-recipe-high.jpg')

ingredient1 = Ingredient.create(name: 'large boneless skinless chicken breast halves')
proportion1 = Proportion.create([unit_id: null ingredient_id: ingredient1.id, quantity:3, receipe_id: gumbo.id])

ingredient2 = Ingredient.create(name: 'Salt and pepper')
proportion2 = Proportion.create([unit_id: null ingredient_id: ingredient2.id, quantity: null, receipe_id: gumbo.id])

ingredient3 = Ingredient.create(name: 'vegetable oil')
unit3       = Unit.create(name: 'cup')
proportion3 = Proportion.create([unit_id: unit3.id ingredient_id: ingredient3.id, quantity: 0.25, receipe_id: gumbo.id])

ingredient4 = Ingredient.create(name: 'all-purpose flour')
unit4       = Unit.create(name: 'cup')
proportion4 = Proportion.create([unit_id: unit4.id  ingredient_id: ingredient4.id, quantity: 0.25, receipe_id: gumbo.id])

ingredient5 = Ingredient.create(name: 'margarine')
unit5       = Unit.create(name: 'tablespoons')
proportion5 = Proportion.create([unit_id: unit5.id ingredient_id: ingredient5.id, quantity: 5, receipe_id: gumbo.id])

ingredient6 = Ingredient.create(name: 'large onion, chopped')
proportion6 = Proportion.create([unit_id: null ingredient_id: ingredient6.id, quantity: 1, receipe_id: gumbo.id])

ingredient7 = Ingredient.create(name: 'green bell pepper, seeded and chopped')
proportion7 = Proportion.create([unit_id: null ingredient_id: ingredient7.id, quantity: 1, receipe_id: gumbo.id])

ingredient8 = Ingredient.create(name: 'stalks celery chopped')
proportion8 = Proportion.create([unit_id: null ingredient_id: ingredient8.id, quantity: 3, receipe_id: gumbo.id])

ingredient9 = Ingredient.create(name: 'Worcestershire sauce')
unit9       = Unit.create(name: 'cup')
proportion9 = Proportion.create([unit_id: unit9.id ingredient_id: ingredient9.id, quantity: 0.25, receipe_id: gumbo.id])

ingredient10 = Ingredient.create(name: 'flat leaf parsley, stems and leaves, coarsely chopped, plus chopped leaves for garnish')
unit10       = Unit.create(name: 'bunch')
proportion10 = Proportion.create([unit_id: unit10.id ingredient_id: ingredient10.id, quantity: 0.25, receipe_id: gumbo.id])

ingredient11 = Ingredient.create(name: 'hot water')
unit11       = Unit.create(name: 'cups')
proportion11 = Proportion.create([unit_id: unit11.id ingredient_id: ingredient11.id, quantity: 4, receipe_id: gumbo.id])

ingredient12 = Ingredient.create(name: 'beef bouillon cubes')
proportion12 = Proportion.create([unit_id: null ingredient_id: ingredient12.id, quantity: 5, receipe_id: gumbo.id])

ingredient13 = Ingredient.create(name: '(14-ounce can) stewed tomatoes with juice')
proportion13 = Proportion.create([unit_id: null ingredient_id: ingredient13.id, quantity: 1, receipe_id: gumbo.id])

ingredient14 = Ingredient.create(name: 'frozen sliced okra')
unit14       = Unit.create(name: 'cups')
proportion14 = Proportion.create([unit_id: unit14.id ingredient_id: ingredient14.id, quantity: 2, receipe_id: gumbo.id])


ingredient15 = Ingredient.create(name: 'green onions, sliced, white and green parts')
proportion15 = Proportion.create([unit_id: null ingredient_id: ingredient15.id, quantity: 4, receipe_id: gumbo.id])

ingredient16 = Ingredient.create(name: 'cloves garlic minced')
proportion16 = Proportion.create([unit_id: null ingredient_id: ingredient16.id, quantity: 8, receipe_id: gumbo.id])

ingredient17 = Ingredient.create(name: 'small shrimp, peeled, deveined and cooked')
unit17       = Unit.create(name: 'pounds')
proportion17 = Proportion.create([unit_id: unit17.id ingredient_id: ingredient17.id, quantity: 0.5, receipe_id: gumbo.id])

ingredient18 = Ingredient.create(name: 'smoked sausage, cut into 1/4-inch slices')
unit18       = Unit.create(name: 'pound')
proportion18 = Proportion.create([unit_id: unit18.id ingredient_id: ingredient18.id, quantity:1, receipe_id: gumbo.id]) 

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


omlet = Recipe.create(name: 'shrimp and avocado omelet', view_count: 0, user_id: User.all[1], image_url: 'http://farm3.static.flickr.com/2765/4165912035_70e5e7c364.jpg')


ingredient20 = Ingredient.create(name: 'ripe tomato, diced')
proportion20 = Proportion.create([unit_id: null ingredient_id: ingredient20.id, quantity: 0.25, receipe_id: omelet.id]) 

ingredient21 = Ingredient.create(name: 'ripe avocado, diced')
proportion21 = Proportion.create([unit_id: null ingredient_id: ingredient20.id, quantity: 0.25, receipe_id: omelet.id]) 

ingredient22 = Ingredient.create(name: 'chopped fresh cilantro, (optional)')
unit22       = Unit.create(name: 'tablespoon')
proportion22 = Proportion.create([unit_id: unit22.id ingredient_id: ingredient22.id, quantity: 1, receipe_id: omelet.id]) 

ingredient23 = Ingredient.create(name: '')
unit23       = Unit.create(name: '')
proportion23 = Proportion.create([unit_id: unit20.id ingredient_id: ingredient20.id, quantity:1, receipe_id: omelet.id]) 
1/8 teaspoon sea salt

ingredient20 = Ingredient.create(name: '')
proportion20 = Proportion.create([unit_id: unit20.id ingredient_id: ingredient20.id, quantity:1, receipe_id: omelet.id]) 
Freshly ground black pepper

ingredient20 = Ingredient.create(name: '')
proportion20 = Proportion.create([unit_id: unit20.id ingredient_id: ingredient20.id, quantity:1, receipe_id: omelet.id]) 
2 eggs

ingredient20 = Ingredient.create(name: '')
unit20       = Unit.create(name: '')
proportion20 = Proportion.create([unit_id: unit20.id ingredient_id: ingredient20.id, quantity:1, receipe_id: omelet.id]) 
1 tablespoon butter

ingredient20 = Ingredient.create(name: '')
proportion20 = Proportion.create([unit_id: unit20.id ingredient_id: ingredient20.id, quantity:1, receipe_id: omelet.id]) 
3 or 4 cooked shrimp, chopped roughly

ingredient20 = Ingredient.create(name: '')
unit20       = Unit.create(name: '')
proportion20 = Proportion.create([unit_id: unit20.id ingredient_id: ingredient20.id, quantity:1, receipe_id: omelet.id]) 
1/3 cup grated cheese (medium cheddar or Monterey jack)


Toss tomato, avocado and cilantro together in a small bowl. Season to taste with salt and pepper. Set aside.

Beat eggs in a separate small bowl just until whites and yolks are combined, not long enough to become frothy.

Over medium-high heat, melt butter in a 6- or 8-inch skillet (preferably slope-sided and non-stick) until bubbling but not brown. Tilt skillet to spread butter evenly around and up sides.

Pour eggs into the hot skillet, tilting and shaking the pan gently with one hand while stirring eggs briskly with the flat of a fork. Tilt pan and lift edges of omelet with a fork to allow runny egg to reach sides and cook. When eggs begin to firm up and there is almost no runny egg left, add shrimp and cheese, spreading them over the center third of the omelet. Immediately use the fork to fold each side of omelet up over center filling. Tilt the pan to help roll omelet into a loose cylinder. Cook 10 to 30 seconds longer, depending on how brown you prefer the bottom (check for brownness by lifting a corner). Slide omelet onto a warmed plate, top with tomato-avocado mixture and serve.


sandwich = Recipe.create(name: 'vietnamese chicken sandwich', view_count: 0, user_id: User.all.first, image_url: 'http://assets.epicurious.com/photos/560d77e6f9a841923089d53a/6:4/w_620%2Ch_413/241475_hires.jpg')

1/2 pound daikon, peeled
1 carrot, peeled
1/2 cup rice vinegar (not seasoned)
1 tablespoon sugar
1 (24-inch) soft baguette
2 tablespoons vegetable oil
1 tablespoon Asian fish sauce
1/2 teaspoon soy sauce
1/4 pound liverwurst
2 fresh jalapeños, thinly sliced
1/2 sweet onion, cut into 1/4-inch rings
3/4 cup packed cilantro sprigs
2 cooked chicken breasts from a rotisserie chicken, thinly sliced
Lettuce leaves
2 tablespoons mayonnaise

Preheat oven to 350°F with rack in middle.
Shred daikon and carrot in a food processor fitted with medium shredding disk. Stir together vinegar, sugar, and 1/2 teaspoon salt and toss with shredded vegetables. Let slaw stand, stirring occasionally, 15 minutes.
Meanwhile, heat baguette on rack in oven until crusty, about 5 minutes. Cut off and discard round ends, then split baguette.
Mix together oil, fish sauce, and soy sauce and brush on cut sides of bread. Spread liverwurst on bottom layer of bread and top with chiles, onion, and cilantro.
Drain slaw in a colander.
Arrange chicken, slaw, and lettuce on cilantro. Spread top layer of bread with mayonnaise and cut sandwich crosswise into fourths.


mole = Recipe.create(name: 'Mole Negro', view_count: 0, user_id: User.all[1], image_url: 'http://foodnetwork.sndimg.com/content/dam/images/food/fullset/2003/10/27/1/ad1a01_mole_negro1.jpg.rend.sni12col.landscape.jpeg')

Ingredients
1 pound ancho chiles
1/2 pound guajillo or dried mirasol chile
1/2 pound dried cascabel chile, or rattle chile
2 pounds tomatoes, chopped
1 pound Mexican green tomato or tomatillo, chopped
Corn oil
1 telera roll or 4 slices white bread
1 cinnamon stick
4 to 5 cloves
4 to 5 whole peppercorns
1 sprig fresh thyme
1 pinch cumin
1/2 cup sesame seeds
1/2 cup shelled peanuts
1/2 cup blanched almonds
1/2 cup small raisins
1 1/2 plantains, chopped
1/2 cup walnuts
1 small onion, roasted, then chopped
1 small garlic clove, roasted, then minced
1 corn tortilla
1 piece unsweetened chocolate square, Mexican chocolate is preferred
1/2 cup chicken stock, plus 2 1/2 cups
3 tablespoons vegetable shortening

Toast ancho, guajillo, and cascabel chiles in a heavy skillet until skins blister. Remove from skillet and stem, seed, and devein chiles. Set aside.

Place tomatoes and green tomatoes in a saucepan and bring to a boil. Drain and blend in blender or food processor and set aside.

In a large saucepan, heat corn oil over low flame. Cut the telera bread or 4 slices of white bread, into pieces and fry in the corn oil until golden brown. Add cinnamon stick, cloves, peppercorns, thyme, cumin, sesame seeds, peanuts, almonds, raisins, plantains, and walnuts. Stir ingredients together. Add more corn oil, to coat ingredients lightly. Add chopped roasted onion and minced roasted garlic. Continue to fry over low flame for about 20 minutes. Add blended tomato mixture. Remove from heat and set aside.

Place corn tortilla over open flame and cook until burnt and crispy. Cut up and set aside.

In a medium frying pan, fry roasted chiles in corn oil along with burnt tortilla pieces for a few minutes. Combine tomato/spice/nut mixture with chile mixture in large saucepan. Add chocolate piece and cook until melted over a low flame. Add about 1/2 cup chicken stock to mixture and stir. Place mixture into blender or food processor and puree until all ingredients have combined completely. More chicken stock may be added to smooth out sauce.

In a large saucepan, heat vegetable shortening. Cook the puree in the shortening, stirring constantly. Add more of the chicken stock until you achieve the right level of consistency that you'd like. Warm sauce for another 30 minutes over a low flame.
