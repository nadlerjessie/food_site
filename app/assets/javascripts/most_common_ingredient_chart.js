var dataSetProperties = {
  label: 'Most Used Ingredients',
  fillColor: 'rgba(220,220,220,0.5)',
  strokeColor: 'rgba(220,220,220,0.8)',
  highlightFill: 'rgba(220,220,220,0.75)',
  highlightStroke: 'rgba(220,220,220,1)'
}

$(function() {
  getIngredientCount(ingredientSuccess);
});

function extractCountOfIngredients(ingredients) {

  var ingredientCount = []

  ingredients.forEach(function(ingredient){
    ingredientCount.push(ingredient.count);
  });

  return ingredientCount;

}

function extractNames(ingredients) {

  var ingredientNames = []

  ingredients.forEach(function(ingredient){
    ingredientNames.push(ingredient.name);
  });

  return ingredientNames;

}

function chartData(categories, inputData) {
  return { labels :  categories , datasets : [ { label: dataSetProperties.label, fillColor: dataSetProperties.fillColor,
  strokeColor: dataSetProperties.strokeColor, highlightFill: dataSetProperties.highlightFill, highlightStroke: dataSetProperties.highlightStroke , data : inputData  } ] };
}

function getIngredientCount(callback){
  $.ajax({
    url: '/admin/analytics',
    method: "GET",
    dataType: "JSON"
  }).success(function(data){
    callback(data.rankings);
  });
}

function ingredientSuccess(parsedJSON) {
    var names = extractNames(parsedJSON);
    var numIngredients = extractCountOfIngredients(parsedJSON);
    var chart = chartData(names, numIngredients);
    var div_id = $('#top-ingredient-chart');
    var ctx = div_id[0].getContext('2d');
    var barChart = new Chart(ctx).Bar(chart);
}
