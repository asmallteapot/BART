# frozen_string_literal: true

require 'rubocop/rake_task'

task default: %i[rubocop xcode jazzy]

RuboCop::RakeTask.new

desc 'Generate Xcode project'
task :xcode do
  `swift package generate-xcodeproj`
end

desc 'Generate documentation'
task :jazzy do
  require 'jazzy'

  config = Jazzy::Config.parse!
  Jazzy::DocBuilder.build(Jazzy::Config.instance = config)
end
