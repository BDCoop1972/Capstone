Rails.application.routes.draw do
  get "/jewishtimes" => "jewish_times#index"
  post "/jewishtimes" => "jewish_times#create"
  get "/jewishtimes/:id" => "jewish_times#show"
  patch "/jewishtimes/id" => "jewish_times#update"
  delete "/jewishtimes" => "jewish_times#destroy"

end
