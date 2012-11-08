Rails.application.routes.draw do
  root :to => "posts#index"

  devise_for :users, :path => "", :path_names => { :sign_in => 'sign_in',
                                                   :sign_out => 'sign_out',
                                                   :password => 'secret',
                                                   :confirmation => 'verification',
                                                   :unlock => 'unblock',
                                                   :registration => 'sign_up',
                                                   :sign_up => ''
  }

  mount Slate::Engine => "/slate"
end
