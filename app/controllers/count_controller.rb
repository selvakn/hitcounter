class CountController < ApplicationController
  def index
    @user = User.find_by_name(params[:name]) || User.find_by_name("admin")
    stat = @user.stats.find_or_initialize_by_url params[:url]
    stat.hit_count +=1
    stat.save
    render :json => stat.to_json, :callback => params[:callback]
  end
  def show
    render :template => 'count/show.xml.erb', :layout => false, :content_type => 'application/xml'
  end
end
