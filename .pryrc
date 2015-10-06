## https://gist.github.com/olivierlacan/1563187
# switch default editor for pry to sublime text
Pry.config.editor = proc {|f,l| "subl #{f}:#{l}" }

# format prompt to be <Rails version>@<ruby version>(<object>)>
Pry.config.prompt = proc do |obj, level, _|
  prompt = "\e[1;30m"
  prompt << "#{Rails.version} @ " if defined?(Rails)
  prompt << "#{RUBY_VERSION}"
  "#{prompt} (#{obj})>\e[0m "
end


if defined?(PryByebug)
  Pry.commands.alias_command 'c', 'continue'
  Pry.commands.alias_command 's', 'step'
  Pry.commands.alias_command 'n', 'next'
  Pry.commands.alias_command 'f', 'finish'
end
