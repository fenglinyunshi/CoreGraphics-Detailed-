//
//  ViewController.m
//  CoreGraphics(Detailed)
//
//  Created by 王红昌 on 17/4/19.
//  Copyright © 2017年 王红昌. All rights reserved.
//

#import "ViewController.h"
#import "CustomView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)loadView{
    CustomView *view = [[CustomView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.view = view;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}



@end
