require "boinc_drone/version"
require "httparty"
require "json"

module BoincDrone
  class Report
    attr_accessor :report
    
    def initialize
      @report = { 
        meta: {
         worker_id: ENV["WORKER_ID"]
        }
      }

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
    
    def post
      begin
        result = HTTParty.post(ENV["WEBHOOK_URL"],
          body: { 
            report: @report
          },
          headers: {
            "X-API-KEY" => ENV["API_KEY"]
          }
        ).body
    
        unless result.status == 200
          sleep(60)
          self.post
        end
      rescue => e
        sleep(60)
        self.post
      end
    end
  end
end
