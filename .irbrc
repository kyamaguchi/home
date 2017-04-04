#puts "Loading #{__FILE__}"
#raise "Use $ pry"
#exit

require 'irb/completion'
require 'pp'
require 'rubygems'
#require 'what_methods'
#require 'wirble'
#Wirble.init
#Wirble.colorize

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

if defined?(Rails) && ENV['DEBUNDLE']

# https://github.com/janlelis/debundle.rb/commit/a46215efd4a8a4b9a3f35cf21d0532e2c34dfe19
module Debundle
  VERSION = '0.8.d'
end

class << Debundle
  # Break out of the Bundler jail.
  #
  # This can be used to load files in development that are not in your Gemfile (for
  # example if you want to test something with a tool that you have locally).
  #
  # @example
  #   Debundle.debundle!
  #   require 'all_the_things'
  #
  # Normally you don't need to cal this directly though, as it is called for you when Pry
  # starts.
  #
  # See https://github.com/carlhuda/bundler/issues/183 for some background.
  # 
  def debundle!
    return unless defined?(Bundler)

    if rubygems_18_or_better?
      if Gem.post_reset_hooks.reject!{ |hook| hook.source_location.first =~ %r{/bundler/} }
        if defined? Bundler::EnvironmentPreserver
          ENV.replace(Bundler::EnvironmentPreserver.new(ENV, %w(GEM_PATH)).backup)
        else
          Bundler.preserve_gem_path
        end
        Gem.clear_paths
        Gem::Specification.reset
        remove_bundler_monkeypatches
      end

    # Rubygems 1.6 — TODO might be quite slow.
    elsif Gem.source_index && Gem.send(:class_variable_get, :@@source_index)
      Gem.source_index.refresh!
      remove_bundler_monkeypatches

    else
      raise "No hacks found :("
    end
  rescue => e
    puts "Debundling failed: #{e.message}"
    puts "When reporting bugs to https://github.com/ConradIrwin/pry-debundle, please include:"
    puts "* gem version: #{Gem::VERSION rescue 'undefined'}"
    puts "* bundler version: #{Bundler::VERSION rescue 'undefined'}"
    puts "* ruby version: #{RUBY_VERSION rescue 'undefined'}"
    puts "* ruby engine: #{RUBY_ENGINE rescue 'undefined'}"
  end

  private

  def rubygems_18_or_better?
    defined?(Gem.post_reset_hooks)
  end

  def rubygems_20_or_better?
    Gem::VERSION.to_i >= 2
  end

  # Ugh, this stuff is quite vile.
  def remove_bundler_monkeypatches
    if rubygems_20_or_better?
      load 'rubygems/core_ext/kernel_require.rb'
    else
      load 'rubygems/custom_require.rb'
    end

    if rubygems_18_or_better?
      Kernel.module_eval do
        def gem(gem_name, *requirements) # :doc:
          skip_list = (ENV['GEM_SKIP'] || "").split(/:/)
          raise Gem::LoadError, "skipping #{gem_name}" if skip_list.include? gem_name
          spec = Gem::Dependency.new(gem_name, *requirements).to_spec
          spec.activate if spec
        end
      end
    else
      Kernel.module_eval do
        def gem(gem_name, *requirements) # :doc:
          skip_list = (ENV['GEM_SKIP'] || "").split(/:/)
          raise Gem::LoadError, "skipping #{gem_name}" if skip_list.include? gem_name
          Gem.activate(gem_name, *requirements)
        end
      end
    end
  end
end

Debundle.debundle!

puts "debundle!"

end

#require 'did-you-mean'
#class Object
#  include DidYouMean
#end

