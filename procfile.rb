#!/usr/bin/env ruby

require 'yaml'

release = $stdin.read
procfile = File.expand_path(File.join(ENV['BUILD_DIR'], 'Procfile'))

if not File.exist?(procfile)

  parsed = YAML.load(release)

  File.open(procfile, 'a+') { |f|
    parsed['default_process_types'].each { |k, v|
      f.puts(k + ': ' + v )
    }
  }

  puts 'Generated Procfile'

else

  puts 'Using existing Procfile'

end
