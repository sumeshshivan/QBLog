//
//  QBLogger.m
//  QBLog
//
//  Created by Mahesh M on 18/08/15.
//  Copyright (c) 2015 qburst. All rights reserved.
//

#import "QBLogger.h"

void QBLogError(NSString *str, ...) {
    
    [[QBLogService sharedInstance] error:str];
}

void QBLogWarning(NSString *str, ...) {
    
    [[QBLogService sharedInstance] warning:str];
}

void QBLogInfo(NSString *str, ...) {
    
    [[QBLogService sharedInstance] info:str];
}

void QBLogTrace(NSString *str, ...) {
    
    [[QBLogService sharedInstance] trace:str];
}

void QBLogDebug(NSString *str, ...) {
    
    [[QBLogService sharedInstance] debug:str];
}

void QBLogSetLevel(QLogLevel level) {
    
    [[QBLogService sharedInstance] setLogLevel:level];
}