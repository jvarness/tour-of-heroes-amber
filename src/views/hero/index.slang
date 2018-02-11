div.row
  div.col-sm-11
    h2 Heroes
  div.col-sm-1
    a.btn.btn-success.btn-xs href="/heroes/new" New
div.table-responsive
  table.table.table-striped
    thead
      tr
        th Name
        th Favorite
        th Actions
    tbody
    - heroes.each do |hero|
      tr
        td = hero.name
        td
          - if hero.favorite
            span.glyphicon.glyphicon-star 
        td
          span
            == link_to("read", "/heroes/#{hero.id}", class: "btn btn-success btn-xs")
            == link_to("edit", "/heroes/#{hero.id}/edit", class: "btn btn-success btn-xs")
            == link_to("delete", "/heroes/#{ hero.id }?_method=delete&_csrf=#{csrf_token}", class: "btn btn-danger btn-xs", onclick: "return confirm('Are you sure?');")
