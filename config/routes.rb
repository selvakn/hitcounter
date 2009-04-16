ActionController::Routing::Routes.draw do |map|
  map.resources :sessions

  map.with_options :controller => 'user' do |user|
    user.show_user 'user/show', :action => 'show'
    user.new_user 'user/new', :action => 'new'
    user.edit_user 'user/edit', :action => 'edit'
    user.update_user 'user/update', :action => 'update'
    user.users 'user/create', :action => 'create', :conditions => { :method => :post }
    user.connect 'user', :action => 'new', :conditions => { :method => :get }
  end

  map.login 'login', :controller => 'sessions', :action => 'new'
  map.logout 'logout', :controller => 'sessions', :action => 'destroy'
  
  map.count 'count/show', :controller => 'count', :action => 'show'
  map.count 'count/:name', :controller => 'count'
  
  map.root :controller => 'sessions', :action => 'new'

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
