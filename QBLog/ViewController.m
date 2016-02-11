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
    QBLogSetLevel(QLogLevel_DEBUG);
    
    // QBLogDebug Log without __PRETTY_FUNCTION and __LINE__
    QBLogDebug(@"Reached Home");
    
    // Methode 1 for QBLogDebug Log with __PRETTY_FUNCTION and __LINE__
    QBLogDebugDetail(@"Reached Home");
    // Methode 2 for QBLogDebug Log with __PRETTY_FUNCTION and __LINE__
    QBLog(QBLogDebug,@"Reached Home");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    // Dispose of any resources that can be recreated.
}

@end
