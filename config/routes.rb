Rails.application.routes.draw do

  get("/users", { :controller => "users", :action => "index"})

  get("/", { :controller => "users", :action => "index"})

  get("/users/:path_username", { :controller => "users", :action => "show_details"})

  get("/photos", { :controller => "photos", :action => "index"})

  get("/photos/:path_photo", { :controller => "photos", :action => "show_details"})

  get("/delete_photo/:path_photo", { :controller => "photos", :action => "delete"})

  get("/insert_photo", { :controller => "photos", :action => "create"})

  get("/insert_username", { :controller => "users", :action => "create"})

  get("/update_photo/:path_photo", { :controller => "photos", :action => "update"})
  
  get("/update_user/:path_user", { :controller => "users", :action => "update"})

  get("/add_comment", { :controller => "photos", :action => "comment"})

end
