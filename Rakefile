require "rspec/core/rake_task"

task :default => "spec:unit"

desc 'Run unit and integration tests'
task :spec => ['spec:unit', 'spec:integration']

namespace :spec do
  def spec_to_subdir(subdir)
    RSpec::Core::RakeTask.new(subdir.to_sym) do |task|
      task.pattern.gsub!(/^spec/, "spec/#{subdir}")
      task.verbose = false
    end
  end

  spec_to_subdir("unit")
  spec_to_subdir("integration")
end
