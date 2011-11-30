class NameController < ApplicationController
  def index
    show
  end

  def show
    @name=Name.select("name, gender").find_by_name(params[:name])
    if @name!=nil
      @name_json=["success" =>true, "name" => @name]
      render json: @name_json
    else
      @name_json=["success" => false]
      render json: @name_json
    end


  end

end
