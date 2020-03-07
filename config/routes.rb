Rails.application.routes.draw do



  # Routes for the Food item resource:

  # CREATE
  post("/insert_food_item", { :controller => "food_items", :action => "create" })
          
  # READ
  get("/food_items", { :controller => "food_items", :action => "index" })
  
  get("/food_items/:path_id", { :controller => "food_items", :action => "show" })
  
  # UPDATE
  
  post("/modify_food_item/:path_id", { :controller => "food_items", :action => "update" })
  
  # DELETE
  get("/delete_food_item/:path_id", { :controller => "food_items", :action => "destroy" })

  #------------------------------

  # Routes for the Follow request resource:

  # CREATE
  post("/insert_follow_request", { :controller => "follow_requests", :action => "create" })
          
  # READ
  get("/follow_requests", { :controller => "follow_requests", :action => "index" })
  
  get("/follow_requests/:path_id", { :controller => "follow_requests", :action => "show" })
  
  # UPDATE
  
  post("/modify_follow_request/:path_id", { :controller => "follow_requests", :action => "update" })
  
  # DELETE
  get("/delete_follow_request/:path_id", { :controller => "follow_requests", :action => "destroy" })

  #------------------------------

  # Routes for the Fridge resource:

  # CREATE
  post("/insert_fridge", { :controller => "fridges", :action => "create" })
          
  # READ
  get("/fridges", { :controller => "fridges", :action => "index" })
  
  get("/fridges/:path_id", { :controller => "fridges", :action => "show" })
  
  # UPDATE
  
  post("/modify_fridge/:path_id", { :controller => "fridges", :action => "update" })
  
  # DELETE
  get("/delete_fridge/:path_id", { :controller => "fridges", :action => "destroy" })

  #------------------------------

  # Routes for the User account:

  # SIGN UP FORM
  get("/user_sign_up", { :controller => "users", :action => "new_registration_form" })        
  # CREATE RECORD
  post("/insert_user", { :controller => "users", :action => "create"  })
      
  # EDIT PROFILE FORM        
  get("/edit_user_profile", { :controller => "users", :action => "edit_registration_form" })       
  # UPDATE RECORD
  post("/modify_user", { :controller => "users", :action => "update" })
  
  # DELETE RECORD
  get("/cancel_user_account", { :controller => "users", :action => "destroy" })

  # ------------------------------

  # SIGN IN FORM
  get("/user_sign_in", { :controller => "user_sessions", :action => "new_session_form" })
  # AUTHENTICATE AND STORE COOKIE
  post("/user_verify_credentials", { :controller => "user_sessions", :action => "create_cookie" })
  
  # SIGN OUT        
  get("/user_sign_out", { :controller => "user_sessions", :action => "destroy_cookies" })
             
  #------------------------------

  # ======= Add Your Routes Above These =============
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end
