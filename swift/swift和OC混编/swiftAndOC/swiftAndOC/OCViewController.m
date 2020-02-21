//
//  OCViewController.m
//  swiftAndOC
//
//  Created by mingyue on 2020/2/21.
//  Copyright © 2020 Gmingyue. All rights reserved.
//

#import "OCViewController.h"
#import "swiftAndOC-Swift.h"

@interface OCViewController ()

@end

@implementation OCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"OC页面";
    self.view.backgroundColor = [UIColor whiteColor];
    
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(100, 100, 100, 50);
    label.backgroundColor = [UIColor whiteColor];
    label.text = @"OC里的页面";
    [self.view addSubview:label];
    
    Person *person = [[Person alloc] initWithName:@"zhangsan" age:20];
    NSLog(@"%@", person.name);
}

-(void)test1
{
    NSLog(@"%@", @"test1");
}

-(void)test2
{
    NSLog(@"%@", @"test2");
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
