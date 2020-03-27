/**
 * Copyright (c) 2017-present, zhenglibao, Inc.
 * email: 798393829@qq.com
 * All rights reserved.
 *
 * This source code is licensed under the MIT-style license found in the
 * LICENSE file in the root directory of this source tree.
 */



#import "FlexAppDelegate.h"
#import "FlexViewController.h"
#import <objc/runtime.h>
@implementation FlexAppDelegate

- (void)setObj:(NSString *)value {

  if (!class_getProperty(self.class, "backProperty")) {
    
    objc_property_attribute_t type = { "T", [[NSString stringWithFormat:@"@\"%@\"",NSStringFromClass([value class])] UTF8String] };
    
    objc_property_attribute_t ownership = { "&", "N" };
    
    objc_property_attribute_t backingivar  = { "V", [[NSString stringWithFormat:@"_%@", @"backProperty"] UTF8String] };
    
    objc_property_attribute_t attr[] = {type, ownership, backingivar};
    
//  NSLog(@"%d,", class_addProperty(self.class, "backProperty", attr, 3));
    
//    class_addMethod(self.class, @selector(setBackObj:), (IMP)setBackProperty, "V@:@");
    
//    class_addMethod(self.class, @selector(backObj), (IMP)getBackProperty, "@@:");
  }
  
//  [self performSelector:@selector(setBackObj:) withObject:value];
}

//id getBackProperty(id self, SEL sel) {
//
//  Ivar ivar = class_getInstanceVariable(KVOObject.class , "_obj");
//
//  return object_getIvar(self, ivar);
//}
//
//void setBackProperty(id self, SEL _sel, TestObj *obj) {
//
//  Ivar ivar = class_getInstanceVariable(KVOObject.class , "_obj");
//
//  id old = object_getIvar(self, ivar);
//
//  if (old != obj) {
//
//    object_setIvar(self, ivar, obj);
//  }
//}
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    [self setObj:@"xx"];
    FlexRestoreIsNetSetter(YES);
    FlexRestorePreviewSetting();
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    
    FlexViewController *vc = [[FlexViewController alloc] init];
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    self.window.rootViewController = nav;
    
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
