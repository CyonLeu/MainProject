//
//  ViewController.m
//  MainProject
//
//  Created by FlyingFish on 2021/11/19.
//

#import "ViewController.h"
#import <CTMediator+ModuleA.h>
#import <CTMediator+ModuleB.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (IBAction)onShowModuleAHome:(id)sender{
    
    //用runtime自己调用ModuleA
    [self originCallModelA];

    //通过中介来调用ModuleA，本质的原理是一样的
//    UIViewController *AHomeVC = [[CTMediator sharedInstance] getHomeVC:@"Main call A Home"];
//    [self.navigationController pushViewController:AHomeVC animated:YES];
}

//使用模块A
- (IBAction)onShowModuleBPage:(id)sender{
    UIViewController *BHomeVC = [[CTMediator sharedInstance] getHomePage:@"Main call B Page"];
    [self.navigationController pushViewController:BHomeVC animated:YES];
}

- (void)originCallModelA {
    Class homeClass = NSClassFromString(@"Target_A");
    SEL selector = NSSelectorFromString(@"Action_getHome:");

    id target = [[homeClass alloc] init];

    NSDictionary *params = @{@"desc":@"This is home \n from Target alloc"};

    UIViewController *homeVC = [target performSelector:selector withObject:params];
    [self.navigationController pushViewController:homeVC animated:YES];
}


@end
