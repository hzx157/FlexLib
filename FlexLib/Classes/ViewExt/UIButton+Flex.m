/**
 * Copyright (c) 2017-present, zhenglibao, Inc.
 * email: 798393829@qq.com
 * All rights reserved.
 *
 * This source code is licensed under the MIT-style license found in the
 * LICENSE file in the root directory of this source tree.
 */



#import "UIButton+Flex.h"
#import "UIView+Flex.h"
#import <objc/runtime.h>
#import "../FlexUtils.h"
#import "../FlexNode.h"

@implementation UIButton (Flex)
FLEXSET(text)
{
    [self setTitle:sValue forState:UIControlStateNormal];
}
FLEXSET(title)
{
    [self setTitle:sValue forState:UIControlStateNormal];
}
FLEXSET(color)
{
    UIColor* clr = colorFromString(sValue,owner);
    if(clr!=nil){
        [self setTitleColor:clr forState:UIControlStateNormal];
    }
}
FLEXSET(buttonFontSize)
{
    self.titleLabel.font = [UIFont systemFontOfSize:[sValue floatValue]];
}

FLEXSET(buttonBackgroundImage)
{
    UIImage* img = [UIImage imageNamed:sValue inBundle:[owner bundleForImages] compatibleWithTraitCollection:nil];
    [self setBackgroundImage:img forState:UIControlStateNormal];
}


@end
