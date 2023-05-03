class UsersController < ApplicationController

  def index
    
    matching_users = User.all

    @list_of_users = matching_users.order({ :username => :asc})

    render({:template => "user_templates/index.html.erb"})

  end

  def show_details

    url_username = params.fetch("path_username")
    matching_usernames = User.where({:username => url_username})
    @the_user = matching_usernames.at(0)

    if @the_user == nil
      redirect_to("/404")
    else
      render({:template => "user_templates/show.html.erb"})
    end

  end

  def create

    the_username = params.fetch("input_username")


    new_user = User.new
    new_user.username = the_username

    new_user.save

    redirect_to("/users/#{new_user.username}")

  end

  def update

    the_user = params.fetch("path_user")
    matching_user = User.where({:username => the_user})
    update_username = matching_user.at(0)
    
    update_username.username = params.fetch("input_username")

    update_username.save

    redirect_to("/users/#{params.fetch("input_username")}")

  end

end
