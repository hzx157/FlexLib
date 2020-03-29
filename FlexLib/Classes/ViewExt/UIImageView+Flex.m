/**
 * Copyright (c) 2017-present, zhenglibao, Inc.
 * email: 798393829@qq.com
 * All rights reserved.
 *
 * This source code is licensed under the MIT-style license found in the
 * LICENSE file in the root directory of this source tree.
 */


#import "UIImageView+Flex.h"
#import "UIView+Flex.h"
#import "../FlexUtils.h"
#import "../FlexNode.h"
#import <objc/runtime.h>
#import <SDWebImage/UIImageView+WebCache.h>
static char *kFlexImageKey = "kImageKey";

@implementation UIImageView (Flex)


-(UIImage *)imgDirName:(NSString*)sValue Owner:(NSObject*)owner{
    
    
        if (@available(iOS 13.0, *)) {
            if (UITraitCollection.currentTraitCollection.userInterfaceStyle == UIUserInterfaceStyleDark) {
                
            }
            else {
                
            }
        }
 
    NSString *imgDir = [[NSUserDefaults standardUserDefaults]objectForKey:FLEXIMGDIR];
    if(![sValue hasSuffix:@".png"]){
      imgDir = [imgDir stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.png",sValue]];
    }else{
         imgDir = [imgDir stringByAppendingPathComponent:sValue];
    }
    
    NSString *documentPath = [[FlexNode getCacheDir] stringByAppendingPathComponent:imgDir];
    NSLog(@"-图片缓存图片--%@",documentPath);
    NSFileManager* manager=[NSFileManager defaultManager];
    if([manager fileExistsAtPath:documentPath]){
        if (@available(iOS 13.0, *)) {
                 if (UITraitCollection.currentTraitCollection.userInterfaceStyle == UIUserInterfaceStyleDark) {
                    NSString *documentPathDark = [documentPath stringByReplacingOccurrencesOfString:@".png" withString:@"dark.png"];
                     NSString *documentPath2x = [documentPath stringByReplacingOccurrencesOfString:@".png" withString:@"dark@2x.png"];
                     if([manager fileExistsAtPath:documentPathDark]){
                         documentPath = documentPathDark;
                     }else if([manager fileExistsAtPath:documentPath2x]){
                        documentPath = documentPath2x;
                     }
                     
                         
                 }
             }
        return [UIImage imageWithContentsOfFile:documentPath];
    }else{
        
    }
    
   return [UIImage imageNamed:sValue inBundle:[owner bundleForImages] compatibleWithTraitCollection:nil];
   
}

-(UIImage *)runtimeImage{
   return objc_getAssociatedObject(self, kFlexImageKey);
}
- (void)setRuntimeImage:(UIImage *)runtimeImage{
    objc_setAssociatedObject(self, kFlexImageKey, runtimeImage, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
FLEXSET(source)
{
    self.image = [self imgDirName:sValue Owner:owner];
//    UIImage* img = [UIImage imageNamed:sValue inBundle:[owner bundleForImages] compatibleWithTraitCollection:nil];
//    self.image = img ;
}
FLEXSET(defaultSource)
{
    
//    UIImage* img = [UIImage imageNamed:sValue inBundle:[owner bundleForImages] compatibleWithTraitCollection:nil];
    self.runtimeImage = [self imgDirName:sValue Owner:owner];

}
FLEXSET(sdSource)
{
    
    [self sd_setImageWithURL:[NSURL URLWithString:sValue] placeholderImage:self.runtimeImage];
  
}
FLEXSET(highlightSource)
{
    UIImage* img = [UIImage imageNamed:sValue inBundle:[owner bundleForImages] compatibleWithTraitCollection:nil];
    self.highlightedImage = img ;
}
FLEXSET(interactEnable)
{
    self.userInteractionEnabled = String2BOOL(sValue);
}
@end
