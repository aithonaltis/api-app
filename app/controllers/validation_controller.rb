class ValidationController < ApplicationController

  def tc
    @tc=params[:tcno]
    @tc_array=@tc.split(//)
    if @tc_array[0]==0
      @response={:success=>"false"}
    elsif @tc_array.size != 11
      @response={:success=>"false"}
    elsif is_int?(@tc)
      @total_single=0
      i=0
      while i<=8
        @total_single += @tc_array[i].to_i
        i += 2
      end
      @total_double=0
      j=1
      while j<8
        @total_double += @tc_array[j].to_i
        j += 2
      end
	    @tenth_number=(@total_single*7-@total_double)%10
	    @eleventh_number=(@total_single+@total_double+@tenth_number)%10
      if @tenth_number==@tc_array[9].to_i && @eleventh_number==@tc_array[10].to_i
  		  @response={:success=>"true"}
    	else
  		  @response={:success=>"false"}
      end
    else
      @response={:success=>"false"}
    end
    render :json => @response, :status => :ok, :callback => params[:callback]
  end

  def is_int?(str)
    return !!(str =~ /^[-+]?[1-9]([0-9]*)?$/)
  end

  def email
    @email=params[:email]
    if is_valid_email?(@email)
      @response={:success=>"true"}
    else
      @response={:success=>"false"}
    end
    render :json => @response, :status => :ok, :callback => params[:callback]
  end

  def is_valid_email?(email)
    if email.count('@')!=1 || email.count('.')==0
      return FALSE
    elsif email =~ /^[-a-z0-9~!$%^&*_=+}{\'?]+(\.[-a-z0-9~!$%^&*_=+}{\'?]+)*@([a-z0-9_][-a-z0-9_]*(\.[-a-z0-9_]+)*\.(aero|arpa|biz|com|coop|edu|gov|info|int|mil|museum|name|net|org|pro|travel|mobi|[a-z][a-z])|([0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}))(:[0-9]{1,5})?$/i
      return validate_email_domain?(email)
    else
      return FALSE
    end
  end

  def validate_email_domain?(email)
      @domain = email.match(/\@(.+)/)[1]
      begin
        c = Whois::Client.new
        r = c.query(@domain)
        if r.available?
          return FALSE
        else
          return TRUE
        end
      rescue
        return FALSE
      end
  end

  def url_checker
    @url=params[:url]
    if url_check?(@url)
      @response={:success=>"true"}
    else
      @response={:success=>"false"}
    end
    render :json => @response, :status => :ok, :callback => params[:callback]

  end
  def url_check?(site_url)
    begin
      @request = Net::HTTP.get_response(URI.parse(site_url))
      if @request.code.to_i == 200
        return TRUE
      else
        return FALSE
      end
    rescue
      return FALSE
    end
  end

end
