require "boinc_drone/version"
require "httparty"
require "json"

module BoincDrone
  class Report
    attr_accessor :report, :webhook_url
    
    def initialize(webhook_url: "http://localhost:3000?worker_id=1&api_key=123")
      @webhook_url = webhook_url
      @report = {}

      input = `boinccmd --get_state`
      input.each_line do |line|
        if line.match(/======== (.+) ========/i)
          match = line.match(/======== (.+) ========/i)
          @scope = match.captures.first.gsub(" ", "_").downcase.to_sym
          instance_variable_set("@#{@scope.to_s}", [])
    
          if @scope == :time_stats
            @time_stats = {}
            @current = @time_stats
          end
        end
  
        if line.match(/\d+\) -----------$/i)
          instance_variable_get("@#{@scope.to_s}") << {}
          @current = instance_variable_get("@#{@scope.to_s}").send(:last)
        elsif line.match(/(\S+): (.*)/i)
          match = line.match(/\s+(.+): (.*)/i)
          @current[match.captures.first.gsub(" ", "_").downcase.to_sym] = match.captures[1]
        else
          @report[@scope.to_sym] = instance_variable_get("@#{@scope.to_s}")
        end
      end
    end
    
    def post!
      begin
        HTTParty.post(@webhook_url,
          body: { 
            report: @report
          }
        )
      rescue => e
      end
    end
  end
end
