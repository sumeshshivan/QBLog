//
//  QBLogger.h
//  QBLog
//
//  Created by Mahesh M on 18/08/15.
//  Copyright (c) 2015 qburst. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "QBLogService.h"

//Macro Log Functions with __PRETTY_FUNCTION__ and __LINE__
#define QBLog(LogType,fmt, ...)   LogType((@"%s [Line %d] " fmt),   __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)

#define QBLogErrorDetail(fmt, ...)   QBLogError((@"%s [Line %d] " fmt),   __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)
#define QBLogWarningDetail(fmt, ...) QBLogWarning((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)
#define QBLogInfoDetail(fmt, ...)    QBLogInfo((@"%s [Line %d] " fmt),    __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)
#define QBLogTraceDetail(fmt, ...)   QBLogTrace((@"%s [Line %d] " fmt),   __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)
#define QBLogDebugDetail(fmt, ...)   QBLogDebug((@"%s [Line %d] " fmt),   __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)

void QBLogError(NSString *str,...);
void QBLogWarning(NSString *str,...);
void QBLogInfo(NSString *str,...);
void QBLogTrace(NSString *str,...);
void QBLogDebug(NSString *str,...);
void QBLogSetLevel(QLogLevel level);
void QBLogClear(NSInteger days);