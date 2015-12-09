$(function(){

  var width = 960;
  var height = 500;

  var svg = d3.select('#map').append("svg")
    .attr('width', width)
    .attr('height', height);

  var path = d3.geo.path();

  var color = d3.scale.cateogry20b();

  var g = svg.append('g');

  d3.json('assets/us.json', function(data){
    var num = 0;
    var data = topojson.feature(data, data.objects.states).features;

  })


})

