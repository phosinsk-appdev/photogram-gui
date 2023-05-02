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

end