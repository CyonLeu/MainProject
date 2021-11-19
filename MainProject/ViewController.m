//
//  ViewController.m
//  MainProject
//
//  Created by FlyingFish on 2021/11/19.
//

#import "ViewController.h"
#import <CTMediator+ModuleA.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (IBAction)onShowModuleAHome:(id)sender{
//    Class homeClass = NSClassFromString(@"Target_A");
//    SEL selector = NSSelectorFromString(@"Action_getHome:");
//
//    id target = [[homeClass alloc] init];
//
//    NSDictionary *params = @{@"desc":@"This is home \n from Target alloc"};
//
//    UIViewController *homeVC = [target performSelector:selector withObject:params];
//    [self presentViewController:homeVC animated:YES completion:nil];
    
    UIViewController *AHomeVC = [[CTMediator sharedInstance] getHomeVC:@"Main call A Home"];
    
    [self presentViewController:AHomeVC animated:YES completion:nil];

}

//使用模块A
- (IBAction)onShowModuleBPage:(id)sender{
    Class homeClass = NSClassFromString(@"Target_A");
    SEL selector = NSSelectorFromString(@"Action_getHome:");
    
    id target = [[homeClass alloc] init];
    
    NSDictionary *params = @{@"desc":@"This is home \n from Target alloc"};
    
    UIViewController *homeVC = [target performSelector:selector withObject:params];
    [self presentViewController:homeVC animated:YES completion:nil];
}


@end
