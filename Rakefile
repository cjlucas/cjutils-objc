# currently:
#   Unit tests don't run
#   iOS Tests scheme doesn't work
task :test do
  system(%Q{xctool -workspace CJUtils.xcworkspace -scheme 'OSX Tests' build build-tests test})
end

task :default => [:test]
