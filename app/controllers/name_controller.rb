class NameController < ApplicationController
  def index
    show
  end

  def show
    @name=Name.find_by_name(params[:name])
    if @name!=nil
      render :json => @name.as_json(:only=>[:gender]), :status => :ok
    else
       render :json => nil, :status => :bad_request
    end
  end
end
