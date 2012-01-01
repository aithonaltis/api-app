class LocationController < ApplicationController
    before_filter :get_request_info

  def index
  end

  def cities
    @cities=City.find(:all);
    render :json=>@cities, :only => [:id, :name], :status => :ok, :callback => params[:callback]
  end

  def districts
    @city=City.find_by_id(params[:city_id])
    if @city.nil?
      render :json => {:error =>'City Not Found'}, :status => :not_found, :callback => params[:callback]
    else
      @districts=@city.districts.order('name ASC')
      render :json=>@districts, :only => [:id, :name], :status => :ok, :callback => params[:callback]
    end
  end

  def regions
    @district=District.find_by_id(params[:district_id])
    if @district.nil?
      render :json => {:error =>'District Not Found'}, :status => :not_found, :callback => params[:callback]
    else
      @regions=@district.regions.order('name ASC')
      render :json=>@regions, :only => [:id, :name, :postal_code], :status => :ok, :callback => params[:callback]
    end
  end

  def streets
    @region=Region.find_by_id(params[:region_id])
    if @region.nil?
      render :json => {:error =>'Region Not Found'}, :status => :not_found, :callback => params[:callback]
    else
      @streets=@region.streets.order('name ASC')
      render :json=>@streets, :only => [:name], :status => :ok, :callback => params[:callback]
    end
  end
end
