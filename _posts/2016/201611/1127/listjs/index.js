var options = {
  valueNames: [ 'name', 'city' ],
  item: '<li><h3 class="name"></h3><p class="city"></p></li>'
};

var values = [
  { name: 'Jonny', city:'Stockholm' }
  , { name: 'Jonas', city:'Berlin' }
];

var hackerList = new List('hacker-list', options, values);
