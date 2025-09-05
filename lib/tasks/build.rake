# lib/tasks/build.rake
namespace :javascript do
  desc "Install JS deps"
  task :install do
    if File.exist?("package-lock.json")
      system "npm ci", exception: true
    else
      system "npm i", exception: true
    end
  end

  desc "Build esbuild bundle to app/assets/builds"
  task build: :install do
    system "npm run build", exception: true
  end
end

# Ensure JS is built before Sprockets runs
Rake::Task["assets:precompile"].enhance(["javascript:build"])
