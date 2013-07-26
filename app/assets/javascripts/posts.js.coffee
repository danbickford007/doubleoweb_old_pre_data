# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
#
#
window.selectCountry = (id) -> 
  $.ajax({
    url:'/posts?country_id='+id
  })

window.selectState = (id) -> 
  $.ajax({
    url:'/posts?state_id='+id
  })

window.selectCity = (id) -> 
  $.ajax({
    url:'/posts?city_id='+id
  })

window.populateOptions = (states, cities) ->
  if states
    ele = $('#state')
    ele.find('option')
      .remove()
      .end();
    ele.append("<option></option>")
    for state in states
      ele.append("<option value='"+state['id']+"'>"+state['name']+"</option>")
  else if cities
    cityEle = $('#city')
    cityEle.find('option')
      .remove()
      .end();
    cityEle.append("<option></option>")
    for city in cities
      cityEle.append("<option value='"+city['id']+"'>"+city['name']+"</option>")
