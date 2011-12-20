class UniversityController < ApplicationController
  def index
  end

  def list
    @universities=University.all
    render :json => @universities.as_json(:only => [:id,:name]), :status => :ok, :callback => params['callback']
  end

  def faculties
    @university=University.find_by_id(params[:university_id])
    if @university.nil?
      render :json => {:error => 'University Not Found'}, :status => :not_found, :callback => params['callback']
    else
      @faculties=@university.faculties
      render :json => @faculties.as_json(:only => [:id,:name]), :status => :ok, :callback => params['callback']
    end
  end

  def departments
    @faculty=Faculty.find_by_id(params[:faculty_id])
    if @faculty.nil?
      render :json => {:error => 'Faculty Not Found'}, :status => :not_found, :callback => params['callback']
    else
      @departments=@faculty.departments
      render :json => @departments.as_json(:only=>[:name]), :status => :ok, :callback => params['callback']    end
  end

end

