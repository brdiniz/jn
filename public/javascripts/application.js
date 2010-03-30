// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
ac_hashes = [];
function auto_complete(field, model, url, fun){
   ac_hashes[model] = [];
   names = [];
  $.get(url, function(data) {
    $(data).find(model).each(function(){
      ac_hashes[model][$(this).find("name").text()] = $(this).find("id").text();
      names.push($(this).find("name").text());
    });
    $(field).unautocomplete()
 	  $(field).autocomplete(names, {
 			minChars: 0,
 			max: 100
 		});
 		
     if (fun){
   		$(field).result(function(event, data, formatter){
   		  fun.call(null, ac_hashes[model][data]);
   		});
     }
  });
}

function add_fields(link, association, content) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + association, "g")
  $(link).parent().before(content.replace(regexp, new_id));
}
