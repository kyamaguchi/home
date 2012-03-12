puts "Loading #{__FILE__}"
raise "Use $ pry"
exit

require 'irb/completion'
require 'pp'
require 'rubygems'
require 'what_methods'
require 'wirble'
Wirble.init
Wirble.colorize

require 'irb/ext/save-history'
IRB.conf[:USE_READLINE] = true
IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:HISTORY_PATH] = File::expand_path("~/.irb.history")

if ENV.include?('RAILS_ENV') && !Object.const_defined?('RAILS_DEFAULT_LOGGER')
  require 'logger'
  RAILS_DEFAULT_LOGGER = Logger.new(STDOUT)
elsif defined?(Rails)
  if Rails.logger
    Rails.logger = Logger.new(STDOUT)
    ActiveRecord::Base.logger = Rails.logger
  end
end

#require 'did-you-mean'
#class Object
#  include DidYouMean
#end

