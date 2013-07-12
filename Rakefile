# currently:
#   Unit tests don't run
#   iOS Tests scheme doesn't work
task :test do
  $osx_test_success = system(%Q{xcodebuild -workspace CJUtils.xcworkspace -scheme 'OSX Tests' test})
 
  # check exit status 
  unless $osx_test_success
    exit(1)
  end
end

task :default => [:test]
