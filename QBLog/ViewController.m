//
//  ViewController.m
//  QBLog
//
//  Created by Mahesh M on 17/08/15.
//  Copyright (c) 2015 qburst. All rights reserved.
//

#import "ViewController.h"
#import "QBLogger.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    QBLogClear(2);
    QBLogSetLevel(QLogLevel_INFO);
    
    QBLogInfo(@"Reached %@", self);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    // Dispose of any resources that can be recreated.
}

@end
