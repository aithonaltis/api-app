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

  def ip_checker
    @ip=params[:ip]
    @ip_regex = /^([1-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])(\.([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])){3}$/
    if @ip=~@ip_regex
      @response={:success=>"true"}
    else
      @response={:success=>"false"}
    end
    render :json => @response, :status => :ok, :callback => params[:callback]
  end

  def credit_card
    re_visa=/^4\d{15}$/
    re_master=/^5[1-5]\d{14}$/
    re_discover=/^6011\d{12}$/
    re_amex=/^3[4,7]\d{13}$/
    re_diners_club_c_b=/^30[0-5]\d{11}$/
    re_diners_club_i=/^3[6,8]\d{12}$/
    re_diners_club_u_c=/^5[4,5]\d{14}$/
    @credit_card=params[:ccno]
    @credit_card_array=@credit_card.split(//)
    @length=@credit_card_array.size
    if is_int?(@credit_card)
      if @credit_card=~re_visa || @credit_card=~re_master || @credit_card=~re_discover ||
          @credit_card=~re_amex || @credit_card=~re_diners_club_c_b || @credit_card=~re_diners_club_i ||
          @credit_card=~re_diners_club_u_c

        @total_double=0
        i=1
        while i<@length
          @total_double += @credit_card_array[i].to_i
          i += 2
        end
        @total_single=0
        j=0
        while j<=@length
          @total_single += total_number(@credit_card_array[j].to_i*2)
          j += 2
        end
        @total_all=@total_double+@total_single
        if @total_all%10==0
          @response={:success=>"true"}
        else
          @response={:success=>"false"}
        end
      else
        @response={:success=>"false"}
      end
    else
      @response={:success=>"false"}
    end
    render :json => @response, :status => :ok, :callback => params[:callback]
  end

  def total_number(number)
    @number_array=(number.to_s).split(//)
    @total=0
    @number_array.each do |num|
      @total+=num.to_i
    end
    return @total
  end

end
