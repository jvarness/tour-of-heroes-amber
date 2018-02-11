- if hero.errors
  ul.errors
  - hero.errors.each do |error|
    li = error.to_s

== form(action: "/heroes/#{hero.id.to_s}", method: hero.id ? :patch : :post) do
  == csrf_tag
  div.form-group
  == text_field(name: "name", value: hero.name, placeholder: "Name", class: "form-control")
  div.form-group
  div.checkbox
    == label(:favorite) do
      == check_box(:favorite, checked: hero.favorite.to_s == "1")
  == submit("Submit", class: "btn btn-primary btn-xs")
  == link_to("back", "/heroes", class: "btn btn-default btn-xs")
