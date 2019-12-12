Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root :to => "relationships#index"
  # Routes for the Pet resource:

  # CREATE
  get("/pets/new", { :controller => "pets", :action => "new_form" })
  post("/create_pet", { :controller => "pets", :action => "create_row" })

  # READ
  get("/pets", { :controller => "pets", :action => "index" })
  get("/pets/:id_to_display", { :controller => "pets", :action => "show" })

  # UPDATE
  get("/pets/:prefill_with_id/edit", { :controller => "pets", :action => "edit_form" })
  post("/update_pet/:id_to_modify", { :controller => "pets", :action => "update_row" })

  # DELETE
  get("/delete_pet/:id_to_remove", { :controller => "pets", :action => "destroy_row" })
  get("/delete_pet_from_owner/:id_to_remove", { :controller => "pets", :action => "destroy_row_from_owner" })

  #------------------------------

  # Routes for the Report resource:

  # CREATE
  get("/reports/new", { :controller => "reports", :action => "new_form" })
  post("/create_report", { :controller => "reports", :action => "create_row" })

  # READ
  get("/reports", { :controller => "reports", :action => "index" })
  get("/reports/:id_to_display", { :controller => "reports", :action => "show" })

  # UPDATE
  get("/reports/:prefill_with_id/edit", { :controller => "reports", :action => "edit_form" })
  post("/update_report/:id_to_modify", { :controller => "reports", :action => "update_row" })

  # DELETE
  get("/delete_report/:id_to_remove", { :controller => "reports", :action => "destroy_row" })
  get("/delete_report_from_relationship/:id_to_remove", { :controller => "reports", :action => "destroy_row_from_relationship" })

  #------------------------------

  # Routes for the Task resource:

  # CREATE
  get("/tasks/new", { :controller => "tasks", :action => "new_form" })
  post("/create_task", { :controller => "tasks", :action => "create_row" })

  # READ
  get("/tasks", { :controller => "tasks", :action => "index" })
  get("/tasks/:id_to_display", { :controller => "tasks", :action => "show" })

  # UPDATE
  get("/tasks/:prefill_with_id/edit", { :controller => "tasks", :action => "edit_form" })
  post("/update_task/:id_to_modify", { :controller => "tasks", :action => "update_row" })

  # DELETE
  get("/delete_task/:id_to_remove", { :controller => "tasks", :action => "destroy_row" })
  get("/delete_task_from_relationship/:id_to_remove", { :controller => "tasks", :action => "destroy_row_from_relationship" })

  #------------------------------

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
  get("/delete_relationship_from_sitter/:id_to_remove", { :controller => "relationships", :action => "destroy_row_from_sitter" })
  get("/delete_relationship_from_home_owner/:id_to_remove", { :controller => "relationships", :action => "destroy_row_from_home_owner" })

  #------------------------------

  devise_for :users
  # Routes for the User resource:

  # READ
  get("/users", { :controller => "users", :action => "index" })
  get("/users/:id_to_display", { :controller => "users", :action => "show" })

  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
