# lib/tasks/build.rake
def tool?(cmd)
  system("command -v #{cmd} >/dev/null 2>&1")
end

namespace :javascript do
  desc "Install JS deps (yarn if available, else npm)"
  task :install do
    if tool?("yarn")
      system "yarn install --frozen-lockfile", exception: true
    elsif tool?("npm")
      if File.exist?("package-lock.json")
        system "npm ci", exception: true
      else
        system "npm i", exception: true
      end
    else
      abort "No yarn or npm found on PATH during assets:precompile"
    end
  end

  desc "Build esbuild bundle"
  task build: :install do
    if tool?("yarn")
      system "yarn run build", exception: true
    else
      system "npm run build", exception: true
    end
  end
end

# Ensure JS is built before Sprockets runs
Rake::Task["assets:precompile"].enhance(["javascript:build"])
