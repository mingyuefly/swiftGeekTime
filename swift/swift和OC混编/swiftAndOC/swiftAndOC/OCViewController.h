//
//  OCViewController.h
//  swiftAndOC
//
//  Created by mingyue on 2020/2/21.
//  Copyright © 2020 Gmingyue. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface OCViewController : UIViewController

-(void)test1 NS_SWIFT_NAME(myTest());
-(void)test2 NS_SWIFT_UNAVAILABLE("请使用myTest");

@end

NS_ASSUME_NONNULL_END
