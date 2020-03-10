#import "FlutterFormPlugin.h"
#if __has_include(<flutter_form/flutter_form-Swift.h>)
#import <flutter_form/flutter_form-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "flutter_form-Swift.h"
#endif

@implementation FlutterFormPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlutterFormPlugin registerWithRegistrar:registrar];
}
@end
