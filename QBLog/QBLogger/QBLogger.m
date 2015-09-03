//
//  QBLogger.m
//  QBLog
//
//  Created by Mahesh M on 18/08/15.
//  Copyright (c) 2015 qburst. All rights reserved.
//

#import "QBLogger.h"

void QBLogError(NSString *str, ...) {
    
    va_list args;
    va_start(args, str);
    NSString *logString = [[NSString alloc] initWithFormat:str arguments:args];
    [[QBLogService sharedInstance] error:logString];
    va_end(args);
    
}

void QBLogWarning(NSString *str, ...) {
    
    va_list args;
    va_start(args, str);
    NSString *logString = [[NSString alloc] initWithFormat:str arguments:args];
    [[QBLogService sharedInstance] warning:logString];
    va_end(args);
    
}

void QBLogInfo(NSString *str, ...) {
    
    va_list args;
    va_start(args, str);
    NSString *logString = [[NSString alloc] initWithFormat:str arguments:args];
    [[QBLogService sharedInstance] info:logString];
    va_end(args);
    
}

void QBLogTrace(NSString *str, ...) {
    
    va_list args;
    va_start(args, str);
    NSString *logString = [[NSString alloc] initWithFormat:str arguments:args];
    [[QBLogService sharedInstance] trace:logString];
    va_end(args);

}

void QBLogDebug(NSString *str, ...) {
    
    va_list args;
    va_start(args, str);
    NSString *logString = [[NSString alloc] initWithFormat:str arguments:args];
    [[QBLogService sharedInstance] debug:logString];
    va_end(args);
    
}

void QBLogSetLevel(QLogLevel level) {
    
    [[QBLogService sharedInstance] setLogLevel:level];
}

void QBLogClear(NSInteger days) {
    
    [[QBLogService sharedInstance] deleteLogsOlderThan:days];
}