task :release_asset, [] => :environment do
  js_assets = Dir['spec/dummy/public/assets/*.js']
  return puts "ERROR: compiled asset file not found" if js_assets.size != 1
  File.rename js_assets[0], "releases/asynchronizer.#{Asynchronizer::VERSION}.min.js"

  # Delete the directory.
  Dir['spec/dummy/public/assets/*'].each { |file| File.delete file }
  Dir.delete 'spec/dummy/public/assets'
end

Rake::Task["assets:precompile"].enhance do
  Rake::Task["app:release_asset"].invoke
end

