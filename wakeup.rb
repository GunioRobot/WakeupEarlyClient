#!/usr/bin/env ruby -Eutf-8

require 'pp'
require 'uri'
require 'rubygems'
require 'httpclient'
require "logger"

class Hash
  def to_qs
    map {|k, v| [URI.encode(k.to_s), URI.encode(v.to_s)].join('=') }.join('&')
  end
end

module HTTP
  class Message
    def redirect?
      HTTP::Status.redirect? header.status_code
    end
    
    def location
      header.get('Location')[0][1] # => res.header.get returns [['Location', 'http*//www.example.com']]
    end
  end
end

# WakeUpEarlyClient

# === BRIEF DESCRIPTION
# This client will post "I just woke up" message to www.hayaoki-seikatsu.com.
# === DETAILS
# WakeUpEarlyClient will 
# 1. login to www.hayaoki-seikatsu.com using your login name and password
# 2. post "quick-add" cmd to the server to update your wake-up records.
# 
# At this moment(May 2009), www.hayaoki-seikatsu.com provides no API for remote access.
# WakeUpEarlyClient is a quick-and-dirty implementation of www.hayaoki-seikatsu.com client.
class WakeUpEarlyClient
  SERVER = 'http://www.hayaoki-seikatsu.com'
  LOGIN  = SERVER + '/login.php'
  ACTION = SERVER + '/risingtime_add.php'
  
  def initialize
    @header = {
      "User-Agent" => "Ruby HTTPClient/Ruby#{RUBY_VERSION} WakeupEarlyClient"
    }
    @client = HTTPClient.new
    @logger = Logger.new $stdout
  end
  
  def login(mail, password)
    opts = {:cmd => :login, :text_mail => mail, :text_password => password}
    @header['Referer'] = LOGIN
    @logger.debug "POST: #{LOGIN} : #{opts.to_qs}"
    
    res = @client.post_content(LOGIN, opts, @header)
    
    res.force_encoding('UTF-8')
    @validation = get_validation_code(res)
    self
  end
  
  def wakeup
    opts = {:cmd => :quick_add, :validation => @validation}
    @logger.debug "POST: #{ACTION} : #{opts.to_qs}"
    
    res = @client.post_content(ACTION, opts, @header)
    self
  end
  
  private
  def get_validation_code(html)
    html.scan(/<input type=\"hidden\" name=\"validation\" value=\"(.*)\" \/>/).flatten.first
  end
end

if __FILE__ == $0
  mail = 'your@mail.account'
  pass = 'password'
  WakeUpEarlyClient.new.login(mail, pass).wakeup
end

__END__
