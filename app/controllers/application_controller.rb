class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :get_request_info

  private

  def get_request_info
    @r_info=RequestInfo.new
    @r_info.ip=request.remote_ip
    @r_info.url=request.url
    @r_info.params=request.params
    @r_info.save
  end
end
