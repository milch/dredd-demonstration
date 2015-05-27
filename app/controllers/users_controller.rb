class UsersController < ApplicationController
  #POST
  def upload_profile_picture
    uploaded_file = params[:file]
    if uploaded_file.nil?
      head :bad_request
      return
    end
    extension = Rack::Mime::MIME_TYPES.invert[uploaded_file.content_type]
    directory = (Rails.public_path + "profile_images").to_s
    unless Dir.exists? directory
      Dir.mkdir directory
    end
    name = nil
    path = nil
    loop do 
      name = SecureRandom.urlsafe_base64(10)
      path = File.join(directory, name) + extension
      break unless File.exists?(path)
    end

    File.open(path, "wb") { |f| f.write(uploaded_file.read) }

    render status: :created, location: "///" + path.split("/").drop(1).join("/"), json: [true]
  end
end
