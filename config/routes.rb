Rails.application.routes.draw do
  # Routes for the Relationship resource:

  # CREATE
  get("/relationships/new", { :controller => "relationships", :action => "new_form" })
  post("/create_relationship", { :controller => "relationships", :action => "create_row" })

  # READ
  get("/relationships", { :controller => "relationships", :action => "index" })
  get("/relationships/:id_to_display", { :controller => "relationships", :action => "show" })

  # UPDATE
  get("/relationships/:prefill_with_id/edit", { :controller => "relationships", :action => "edit_form" })
  post("/update_relationship/:id_to_modify", { :controller => "relationships", :action => "update_row" })

  # DELETE
  get("/delete_relationship/:id_to_remove", { :controller => "relationships", :action => "destroy_row" })

  #------------------------------

  devise_for :users
  # Routes for the User resource:

  # READ
  get("/users", { :controller => "users", :action => "index" })
  get("/users/:id_to_display", { :controller => "users", :action => "show" })

  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
