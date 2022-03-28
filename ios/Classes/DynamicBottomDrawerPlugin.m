#import "DynamicBottomDrawerPlugin.h"
#if __has_include(<dynamic_bottom_drawer/dynamic_bottom_drawer-Swift.h>)
#import <dynamic_bottom_drawer/dynamic_bottom_drawer-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "dynamic_bottom_drawer-Swift.h"
#endif

@implementation DynamicBottomDrawerPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftDynamicBottomDrawerPlugin registerWithRegistrar:registrar];
}
@end
