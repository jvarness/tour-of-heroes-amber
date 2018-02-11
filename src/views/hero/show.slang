h1 Show Hero
p = hero.name
p = hero.favorite
p
  == link_to("back", "/heroes", class: "btn btn-success btn-xs")
  == link_to("edit", "/heroes/#{hero.id}/edit", class: "btn btn-success btn-xs")
  == link_to("delete", "/heroes/#{hero.id}?_method=delete&_csrf=#{csrf_token}", class: "btn btn-danger btn-xs", onclick: "return confirm('Are you sure?');")
