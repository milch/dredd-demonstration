Rails.application.routes.draw do
  post 'users/me/profile_pic' => 'users#upload_profile_picture', defaults: {format: :json}
end
