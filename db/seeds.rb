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
units50 = Unit.create(name: "pound",abbreviation: "lbs")
units51 = Unit.create(name: "sprig")
units52 = Unit.create(name: "pinch")
units53 = Unit.create(name: "cup")
units54 = Unit.create(name: "tablespoons",abbreviation: "tbs")
units55 = Unit.create(name: "teaspoon")
units56 = Unit.create(name: 'bunch')
units57 = Unit.create(name: 'cups')

gumbo = Recipe.create(name: 'Chicken and Gumbo' , view_count: 0, user_id: User.all[0], image_url: 'http://www.simplecomfortfood.com/wp-content/uploads/2012/10/chicken-gumbo-recipe-high.jpg')
gumbo.categories = [categories[0]]

ingredient1 = Ingredient.create(name: 'large boneless skinless chicken breast halves')
proportion1 = Proportion.create([unit_id: nil, ingredient_id: ingredient1.id, quantity:3, recipe_id: gumbo.id])

ingredient2 = Ingredient.create(name: 'Salt and pepper')
proportion2 = Proportion.create([unit_id: nil, ingredient_id: ingredient2.id, quantity: nil, recipe_id: gumbo.id])

ingredient3 = Ingredient.create(name: 'vegetable oil')
proportion3 = Proportion.create([unit_id: units53.id, ingredient_id: ingredient3.id, quantity: 0.25, recipe_id: gumbo.id])

ingredient4 = Ingredient.create(name: 'all-purpose flour')
proportion4 = Proportion.create([unit_id: units53.id,  ingredient_id: ingredient4.id, quantity: 0.25, recipe_id: gumbo.id])

ingredient5 = Ingredient.create(name: 'margarine')
proportion5 = Proportion.create([unit_id: units54.id, ingredient_id: ingredient5.id, quantity: 5, recipe_id: gumbo.id])

ingredient6 = Ingredient.create(name: 'large onion, chopped')
proportion6 = Proportion.create([unit_id: nil, ingredient_id: ingredient6.id, quantity: 1, recipe_id: gumbo.id])

ingredient7 = Ingredient.create(name: 'green bell pepper, seeded and chopped')
proportion7 = Proportion.create([unit_id: nil, ingredient_id: ingredient7.id, quantity: 1, recipe_id: gumbo.id])

ingredient8 = Ingredient.create(name: 'stalks celery chopped')
proportion8 = Proportion.create([unit_id: nil, ingredient_id: ingredient8.id, quantity: 3, recipe_id: gumbo.id])

ingredient9 = Ingredient.create(name: 'Worcestershire sauce')
proportion9 = Proportion.create([unit_id: units53.id, ingredient_id: ingredient9.id, quantity: 0.25, recipe_id: gumbo.id])

ingredient10 = Ingredient.create(name: 'flat leaf parsley, stems and leaves, coarsely chopped, plus chopped leaves for garnish')
proportion10 = Proportion.create([unit_id: units56.id, ingredient_id: ingredient10.id, quantity: 0.25, recipe_id: gumbo.id])

ingredient11 = Ingredient.create(name: 'hot water')
proportion11 = Proportion.create([unit_id: units57.id, ingredient_id: ingredient11.id, quantity: 4, recipe_id: gumbo.id])

ingredient12 = Ingredient.create(name: 'beef bouillon cubes')
proportion12 = Proportion.create([unit_id: nil, ingredient_id: ingredient12.id, quantity: 5, recipe_id: gumbo.id])

ingredient13 = Ingredient.create(name: '(14-ounce can) stewed tomatoes with juice')
proportion13 = Proportion.create([unit_id: nil, ingredient_id: ingredient13.id, quantity: 1, recipe_id: gumbo.id])

ingredient14 = Ingredient.create(name: 'frozen sliced okra')
proportion14 = Proportion.create([unit_id: units57.id, ingredient_id: ingredient14.id, quantity: 2, recipe_id: gumbo.id])


ingredient15 = Ingredient.create(name: 'green onions, sliced, white and green parts')
proportion15 = Proportion.create([unit_id: nil, ingredient_id: ingredient15.id, quantity: 4, recipe_id: gumbo.id])

ingredient16 = Ingredient.create(name: 'cloves garlic minced')
proportion16 = Proportion.create([unit_id: nil, ingredient_id: ingredient16.id, quantity: 8, recipe_id: gumbo.id])

ingredient17 = Ingredient.create(name: 'small shrimp, peeled, deveined and cooked')
proportion17 = Proportion.create([unit_id: units50.id, ingredient_id: ingredient17.id, quantity: 0.5, recipe_id: gumbo.id])

ingredient18 = Ingredient.create(name: 'smoked sausage, cut into 1/4-inch slices')
proportion18 = Proportion.create([unit_id: units50.id, ingredient_id: ingredient18.id, quantity:1, recipe_id: gumbo.id]) 

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
proportion22 = Proportion.create([unit_id: units54.id, ingredient_id: ingredient22.id, quantity: 1, recipe_id: omelet.id]) 

ingredient23 = Ingredient.create(name: 'sea salt')
proportion23 = Proportion.create([unit_id: units55.id, ingredient_id: ingredient23.id, quantity: 0.125, recipe_id: omelet.id]) 

ingredient24 = Ingredient.create(name: 'Freshly ground black pepper')
proportion24 = Proportion.create([unit_id: nil, ingredient_id: ingredient24.id, quantity: nil, recipe_id: omelet.id]) 


ingredient25 = Ingredient.create(name: 'eggs')
proportion25 = Proportion.create([unit_id: nil, ingredient_id: ingredient25.id, quantity: 2, recipe_id: omelet.id]) 

ingredient26 = Ingredient.create(name: 'butter')
proportion26 = Proportion.create([unit_id: units54.id, ingredient_id: ingredient26.id, quantity: 1, recipe_id: omelet.id]) 

ingredient27 = Ingredient.create(name: 'cooked shrimp, chopped roughly')
proportion27 = Proportion.create([unit_id: nil, ingredient_id: ingredient27.id, quantity: 3, recipe_id: omelet.id]) 

ingredient28 = Ingredient.create(name: 'grated cheese (medium cheddar or Monterey jack)')
proportion28 = Proportion.create([unit_id: units53.id, ingredient_id: ingredient28.id, quantity: 0.33, recipe_id: omelet.id]) 

step20 = Step.create(description: 'Toss tomato, avocado and cilantro together in a small bowl. Season to taste with salt and pepper. Set aside.', recipe_id: omelet.id)
step21 = Step.create(description: 'Beat eggs in a separate small bowl just until whites and yolks are combined, not long enough to become frothy.', recipe_id: omelet.id)
step22 = Step.create(description: 'Over medium-high heat, melt butter in a 6- or 8-inch skillet (preferably slope-sided and non-stick) until bubbling but not brown. Tilt skillet to spread butter evenly around and up sides.', recipe_id: omelet.id)
step23 = Step.create(description: 'Pour eggs into the hot skillet, tilting and shaking the pan gently with one hand while stirring eggs briskly with the flat of a fork. Tilt pan and lift edges of omelet with a fork to allow runny egg to reach sides and cook. When eggs begin to firm up and there is almost no runny egg left, add shrimp and cheese, spreading them over the center third of the omelet. Immediately use the fork to fold each side of omelet up over center filling. Tilt the pan to help roll omelet into a loose cylinder. Cook 10 to 30 seconds longer, depending on how brown you prefer the bottom (check for brownness by lifting a corner). Slide omelet onto a warmed plate, top with tomato-avocado mixture and serve.', recipe_id: omelet.id)


###################
mole = Recipe.create(name: 'Mole' , view_count: 0, user_id: User.all[0], image_url: 'http://foodnetwork.sndimg.com/content/dam/images/food/fullset/2003/10/27/1/ad1a01_mole_negro1.jpg.rend.sni12col.landscape.jpeg')
mole.categories = [categories[0]]

ingredient100 = Ingredient.create(name: 'ancho chiles')
ingredient101 = Ingredient.create(name: 'guajillo chile')
ingredient102 = Ingredient.create(name: 'dried cascabel chile')
ingredient103 = Ingredient.create(name: 'tomatoes, chopped')
ingredient104 = Ingredient.create(name: 'tomatillo')
ingredient105 = Ingredient.create(name: 'corn oil')
ingredient106 = Ingredient.create(name: 'telera roll')
ingredient107 = Ingredient.create(name: 'cinnamon stick')
ingredient108 = Ingredient.create(name: 'cloves')
ingredient109 = Ingredient.create(name: 'whole peppercorns')
ingredient110 = Ingredient.create(name: 'fresh thyme')
ingredient111 = Ingredient.create(name: 'cumin')
ingredient112 = Ingredient.create(name: 'sesame seeds')
ingredient113 = Ingredient.create(name: 'shelled peanuts')
ingredient114 = Ingredient.create(name: 'blanched almonds')
ingredient115 = Ingredient.create(name: 'small raisins')
ingredient116 = Ingredient.create(name: 'plantains')
ingredient117 = Ingredient.create(name: 'walnuts')
ingredient118 = Ingredient.create(name: 'small onion, roasted, then chopped')
ingredient119 = Ingredient.create(name: 'small garlic clove, roasted, then minced')
ingredient120 = Ingredient.create(name: 'corn tortilla')
ingredient121 = Ingredient.create(name: 'unsweetened chocolate square, Mexican chocolate is preferred')
ingredient122 = Ingredient.create(name: 'chicken stock')
ingredient123 = Ingredient.create(name: 'vegetable shortening')


proportions400 = Proportion.create(unit_id: units50.id, ingredient_id:ingredient100.id, quantity:1, recipe_id:mole.id)
proportions401 = Proportion.create(unit_id: units50.id, ingredient_id:ingredient101.id, quantity: 0.5, recipe_id:mole.id)
proportions402 = Proportion.create(unit_id: units50.id, ingredient_id:ingredient102.id, quantity: 0.5, recipe_id:mole.id)
proportions403 = Proportion.create(unit_id: units50.id, ingredient_id:ingredient103.id, quantity:2, recipe_id:mole.id)
proportions404 = Proportion.create(unit_id: units50.id, ingredient_id:ingredient104.id, quantity:1, recipe_id:mole.id)
proportions405 = Proportion.create(unit_id: nil, ingredient_id:ingredient105.id, quantity: nil, recipe_id:mole.id)
proportions406 = Proportion.create(unit_id: nil, ingredient_id:ingredient106.id, quantity:1, recipe_id:mole.id)
proportions407 = Proportion.create(unit_id: nil, ingredient_id:ingredient107.id, quantity:1, recipe_id:mole.id)
proportions408 = Proportion.create(unit_id: nil, ingredient_id:ingredient108.id, quantity:4, recipe_id:mole.id)
proportions409 = Proportion.create(unit_id: units51.id, ingredient_id:ingredient109.id, quantity:4, recipe_id:mole.id)
proportions410 = Proportion.create(unit_id: units52.id, ingredient_id:ingredient110.id, quantity:1, recipe_id:mole.id)
proportions411 = Proportion.create(unit_id: units53.id, ingredient_id:ingredient111.id, quantity:1, recipe_id:mole.id)
proportions412 = Proportion.create(unit_id: units53.id, ingredient_id:ingredient112.id, quantity: 0.5, recipe_id:mole.id)
proportions413 = Proportion.create(unit_id: units53.id, ingredient_id:ingredient113.id, quantity: 0.5, recipe_id:mole.id)
proportions414 = Proportion.create(unit_id: units53.id, ingredient_id:ingredient114.id, quantity: 0.5, recipe_id:mole.id)
proportions415 = Proportion.create(unit_id: nil, ingredient_id:ingredient115.id, quantity: 0.5, recipe_id:mole.id)
proportions416 = Proportion.create(unit_id: units53.id, ingredient_id:ingredient116.id, quantity:1.5, recipe_id:mole.id)
proportions417 = Proportion.create(unit_id: nil, ingredient_id:ingredient117.id, quantity: 0.5, recipe_id:mole.id)
proportions418 = Proportion.create(unit_id: nil, ingredient_id:ingredient118.id, quantity:1, recipe_id:mole.id)
proportions419 = Proportion.create(unit_id: nil, ingredient_id:ingredient119.id, quantity:1, recipe_id:mole.id)
proportions420 = Proportion.create(unit_id: units53.id, ingredient_id:ingredient120.id, quantity:1, recipe_id:mole.id)
proportions421 = Proportion.create(unit_id: units54.id, ingredient_id:ingredient121.id, quantity:1, recipe_id:mole.id)
proportions422 = Proportion.create(unit_id: units53.id, ingredient_id:ingredient122.id, quantity: 0.5, recipe_id:mole.id)
proportions423 = Proportion.create(unit_id: units54.id, ingredient_id:ingredient123.id, quantity:3, recipe_id:mole.id)

step400 = Step.create(description: 'Toast ancho, guajillo, and cascabel chiles in a heavy skillet until skins blister. Remove from skillet and stem, seed, and devein chiles. Set aside.
', recipe_id:mole.id)
step401 = Step.create(description: 'Place tomatoes and green tomatoes in a saucepan and bring to a boil. Drain and blend in blender or food processor and set aside.
', recipe_id:mole.id)
step402 = Step.create(description: 'In a large saucepan, heat corn oil over low flame. Cut the telera bread or 4 slices of white bread, into pieces and fry in the corn oil until golden brown. Add cinnamon stick, cloves, peppercorns, thyme, cumin, sesame seeds, peanuts, almonds, raisins, plantains, and walnuts. Stir ingredients together. Add more corn oil, to coat ingredients lightly. Add chopped roasted onion and minced roasted garlic. Continue to fry over low flame for about 20 minutes. Add blended tomato mixture. Remove from heat and set aside.
', recipe_id:mole.id)
step403 = Step.create(description: 'Place corn tortilla over open flame and cook until burnt and crispy. Cut up and set aside.
', recipe_id:mole.id)
step404 = Step.create(description: 'In a medium frying pan, fry roasted chiles in corn oil along with burnt tortilla pieces for a few minutes. Combine tomato/spice/nut mixture with chile mixture in large saucepan. Add chocolate piece and cook until melted over a low flame. Add about 1/2 cup chicken stock to mixture and stir. Place mixture into blender or food processor and puree until all ingredients have combined completely. More chicken stock may be added to smooth out sauce.
', recipe_id:mole.id)
step405 = Step.create(description: 'In a large saucepan, heat vegetable shortening. Cook the puree in the shortening, stirring constantly. Add more of the chicken stock until you achieve the right level of consistency that you would like. Warm sauce for another 30 minutes over a low flame.', recipe_id:mole)


sandwich = Recipe.create(name: 'Vietnamese Chicken Sandwich' , view_count: 0, user_id: User.all[1], image_url: 'http://assets.epicurious.com/photos/560d77e6f9a841923089d53a/6:4/w_620%2Ch_413/241475_hires.jpg')
sandwich.categories = [categories[2]]

ingredient201 = Ingredient.create(name: 'daikon')
ingredient202 = Ingredient.create(name: 'carrot')
ingredient203 = Ingredient.create(name: 'rice vinegar')
ingredient204 = Ingredient.create(name: 'sugar')
ingredient205 = Ingredient.create(name: 'soft baguette')
ingredient206 = Ingredient.create(name: 'vegetable oil')
ingredient207 = Ingredient.create(name: 'Asian fish sauce')
ingredient208 = Ingredient.create(name: 'soy sauce')
ingredient209 = Ingredient.create(name: 'liverwurst')
ingredient210 = Ingredient.create(name: 'fresh jalapeños, thinly sliced')
ingredient211 = Ingredient.create(name: 'sweet onion, cut into 2/4-inch rings')
ingredient212 = Ingredient.create(name: 'packed cilantro sprigs')
ingredient213 = Ingredient.create(name: 'cooked chicken breasts from a rotisserie chicken, thinly sliced')
ingredient214 = Ingredient.create(name: 'Lettuce leaves')
ingredient215 = Ingredient.create(name: 'mayonnaise')

proportions500 = Proportion.create(unit_id: units50.id, ingredient_id:ingredient201.id, quantity:.5, recipe_id:sandwich.id)
proportions501 = Proportion.create(unit_id: nil, ingredient_id:ingredient202.id, quantity:1, recipe_id:sandwich.id)
proportions502 = Proportion.create(unit_id: units53.id, ingredient_id:ingredient203.id, quantity:.5, recipe_id:sandwich.id)
proportions503 = Proportion.create(unit_id: units54.id, ingredient_id:ingredient204.id, quantity:1, recipe_id:sandwich.id)
proportions504 = Proportion.create(unit_id: nil, ingredient_id:ingredient205.id, quantity:1, recipe_id:sandwich.id)
proportions505 = Proportion.create(unit_id: units54.id, ingredient_id:ingredient206.id, quantity:2, recipe_id:sandwich.id)
proportions506 = Proportion.create(unit_id: units54.id, ingredient_id:ingredient207.id, quantity:1, recipe_id:sandwich.id)
proportions507 = Proportion.create(unit_id: units55.id, ingredient_id:ingredient208.id, quantity:.5, recipe_id:sandwich.id)
proportions508 = Proportion.create(unit_id: units50.id, ingredient_id:ingredient209.id, quantity:.25, recipe_id:sandwich.id)
proportions509 = Proportion.create(unit_id: nil, ingredient_id:ingredient210.id, quantity:2, recipe_id:sandwich.id)
proportions510 = Proportion.create(unit_id: nil, ingredient_id:ingredient211.id, quantity:.5, recipe_id:sandwich.id)
proportions511 = Proportion.create(unit_id: units53.id, ingredient_id:ingredient212.id, quantity:.75, recipe_id:sandwich.id)
proportions512 = Proportion.create(unit_id: nil, ingredient_id:ingredient213.id, quantity:2, recipe_id:sandwich.id)
proportions513 = Proportion.create(unit_id: nil, ingredient_id:ingredient214.id, quantity:nil, recipe_id:sandwich.id)
proportions514 = Proportion.create(unit_id: units54.id, ingredient_id:ingredient215.id, quantity:2, recipe_id:sandwich.id)

step500 = Step.create(description:'Preheat oven to 350°F with rack in middle.', recipe_id:sandwich.id )
step501 = Step.create(description:'Shred daikon and carrot in a food processor fitted with medium shredding disk. Stir together vinegar, sugar, and 1/2 teaspoon salt and toss with shredded vegetables. Let slaw stand, stirring occasionally, 15 minutes.
', recipe_id:sandwich.id )
step502 = Step.create(description:'Meanwhile, heat baguette on rack in oven until crusty, about 5 minutes. Cut off and discard round ends, then split baguette.
', recipe_id:sandwich.id )
step503 = Step.create(description:'Mix together oil, fish sauce, and soy sauce and brush on cut sides of bread. Spread liverwurst on bottom layer of bread and top with chiles, onion, and cilantro.
', recipe_id:sandwich.id)
step504 = Step.create(description:'Drain slaw in a colander.', recipe_id:sandwich.id )
step505 = Step.create(description:'Arrange chicken, slaw, and lettuce on cilantro. Spread top layer of bread with mayonnaise and cut sandwich crosswise into fourths.
', recipe_id:sandwich.id )






