class NameController < ApplicationController
  before_filter :get_request_info

  def index
    show
  end

  def show
    @name=Name.find_by_name(params[:name])
    if @name!=nil
      render :json => @name.as_json(:only=>[:gender]), :status => :ok, :callback => params[:callback]
    else
      render :json => {:error => 'Name Not Found'}, :status => :not_found, :callback => params[:callback]
    end
  end

end
