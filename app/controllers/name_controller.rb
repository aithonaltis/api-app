class NameController < ApplicationController
  respond_to :html, :xml, :json

  def index
    show
  end

  def show
    @name=Name.find_by_name(params[:name])
    respond_with([@name])
  end

end
