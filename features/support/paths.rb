module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name
    
    when /the home\s?page/
      '/'
    
    when /the list of (.+)/
        class_name = $1.pluralize.downcase
        eval("#{class_name}_path")
        
    when /the "(.+)" (.+) (.+)ing screen/
      model = $2
      name = $1
      id = eval(model.camelize).find_by_name(name).id
      return "/#{model.underscore.pluralize}/#{id}" if $3 == "show"
      "/#{model.underscore.pluralize}/#{$3}/#{id}"
      
    when /the show "(.+)" (.+) in the "(.+)" (.+)/
      model_name = $3
      model_clazz = $4
      model = eval(model_clazz.camelize).find_by_name(model_name)
      model_item_name = $1
      model_item_clazz = $2
      model_item = eval(model_item_clazz.camelize).find_by_title(model_item_name)
      "#{model_clazz.underscore.pluralize}/#{model.id}/#{model_item_clazz.underscore.pluralize}/#{model_item.id}"
      
    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))

    else
      raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
        "Now, go and add a mapping in #{__FILE__}"
    end
  end
end

World(NavigationHelpers)
