
## Space X api project
## Startup guide

Before app first start you need to run:

1) `./phrase pull`
2) `flutter pub get`
3) `flutter pub run phrase`
4) `flutter pub run build_runner build --delete-conflicting-outputs`

When cocoa pods install error: Execute below to install the required ffi run:

`sudo arch -x86_64 gem install ffi`

Instead of pod install use:

`arch -x86_64 pod install`

If not work try this

`arch -x86_64 pod install --repo-update`

In case you tried everything and still you are not able to install pods try this as the last resort:

1) `sudo gem uninstall cocoapods`
2) `brew install cocoapods`
3) `arch -x86_64 pod install`