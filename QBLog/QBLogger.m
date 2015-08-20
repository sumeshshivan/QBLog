//
//  QBLogger.m
//  QBLog
//
//  Created by Mahesh M on 18/08/15.
//  Copyright (c) 2015 qburst. All rights reserved.
//

#import "QBLogger.h"
#import "QBLogService.h"

QBLogService *qbLogService;

void QBLogError(NSString *str, ...) {
    
    qbLogService = [QBLogService sharedInstance];
    [qbLogService error:str];
}

void QBLogWarning(NSString *str, ...) {
    
    qbLogService = [QBLogService sharedInstance];
    [qbLogService warning:str];
}

void QBLogInfo(NSString *str, ...) {
    
    qbLogService = [QBLogService sharedInstance];
    [qbLogService info:str];
}

void QBLogTrace(NSString *str, ...) {
    
    qbLogService = [QBLogService sharedInstance];
    [qbLogService trace:str];
}

void QBLogDebug(NSString *str, ...) {
    
    qbLogService = [QBLogService sharedInstance];
    [qbLogService debug:str];
}