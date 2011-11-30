class NameController < ApplicationController
  def index
    show
  end

  def show
    @name=Name.find_by_name(params[:name])
    if @name!=nil
      render :json => {
          :success => true,
          :name => @name.as_json(:only=>[:name, :gender])
      }
      status = :ok
    else
      render :json => {
          :success =>false
      }
      status = :bad_request
    end
  end
end
