# currently:
#   Unit tests don't run
#   iOS Tests scheme doesn't work
task :test do
  # trying both
  $osx_test_success = system(%Q{xcodebuild -workspace CJUtils.xcworkspace -scheme 'OSX Tests' test})
 
  # check exit status 
  exit(1) unless $osx_test_success
  
  $osx_test_success = system(%Q{xctool -workspace CJUtils.xcworkspace -scheme 'OSX Tests' test})
  exit(1) unless $osx_test_success
end

task :default => [:test]
