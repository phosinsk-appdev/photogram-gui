class PhotosController < ApplicationController

  def index
  
    matching_photos = Photo.all
    @list_of_photos = matching_photos.order({:created_at => :desc})



    render({:template => "photo_templates/index.html.erb"})

  end

  def show_details

    url_photo = params.fetch("path_photo")
    matching_photo = Photo.where({:id => url_photo})
    @the_photo = matching_photo.at(0)

    if @the_photo == nil
      redirect_to("/404")
    else
      render({:template => "photo_templates/show.html.erb"})
    end

  end

  def delete

    the_id = params.fetch("path_photo")
    matching_photos = Photo.where({:id => the_id})
    the_photo = matching_photos.at(0)
    the_photo.destroy

    redirect_to("/photos")

  end

  def create

    the_image = params.fetch("query_image")
    the_caption = params.fetch("query_caption")
    the_owner = params.fetch("query_owner")

    new_photo = Photo.new
    new_photo.image = the_image
    new_photo.caption = the_caption
    new_photo.owner_id = the_owner

    new_photo.save

    redirect_to("/photos/#{new_photo.id}")

  end

  def update


    the_id = params.fetch("path_photo")
    matching_photos = Photo.where({:id => the_id})
    update_photo = matching_photos.at(0)
    
    update_photo.image = params.fetch("input_image")
    update_photo.caption = params.fetch("input_caption")

    update_photo.save

    redirect_to("/photos/#{update_photo.id}")

  end

  def comment

    the_photo_id = params.fetch("input_photo_id")
    the_author_id = params.fetch("input_author_id")
    the_comment = params.fetch("input_body")

    new_comment = Comment.new
    new_comment.photo_id = the_photo_id
    new_comment.author_id = the_author_id
    new_comment.body = the_comment

    new_comment.save

    redirect_to("/photos/#{the_photo_id}")

  end

end
