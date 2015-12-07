function addRecipesToIndex(data) {

};

function fetchJson() {
  $.ajax({
    url: baseUrl + counter + "/3",
    contentType: 'application/json',
    dataType: 'jsonp',
    success: function(data) {
      addCarsToDOM(data);
      counter += 1;
    }
  });
};