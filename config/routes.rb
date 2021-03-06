Rails.application.routes.draw do
   namespace :api do
    namespace :v1 do
      resources  :clips, :users, :user_clips
 
      post "/login", to: "auth#create"

      get "/auto_login", to: "auth#auto_login"

      post "/user_clips/unsave", to: "user_clips#unsave"

      post "/audio_process", to: "clips#audio_process"




    end
  end
end
