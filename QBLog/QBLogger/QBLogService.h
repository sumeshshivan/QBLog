//
//  QBLogService.h
//  QBLog
//
//  Created by Mahesh M on 17/08/15.
//  Copyright (c) 2015 qburst. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    QLogLevel_NONE      = -1,
    QLogLevel_ERROR     = 0,
    QLogLevel_WARNING   = 1,
    QLogLevel_INFO      = 2,
    QLogLevel_TRACE     = 3,
    QLogLevel_DEBUG     = 4
} QLogLevel;

//
// QLogService is a class to handle logging details in different level(DEBUG, TRACE, INFO, WARN.. ) to a log file for each date.
// The logs file are stored in documents folder and can be downloaded,
//

@interface QBLogService : NSObject
{
    
}

@property (nonatomic) QLogLevel logLevel;

+ (QBLogService *)sharedInstance;

//
// Delete the log files which are older than given number of days
//
- (void) deleteLogsOlderThan:(NSInteger)days;

//
// Information Logging
//
- (void) info:(NSString*)logString;

//
// Warning Logging
//
- (void) warning:(NSString*)logString;

//
// Error Logging
//
- (void) error:(NSString*)logString;

//
// Debug items Logging
//
- (void) debug:(NSString*)logString;

//
// Trace Logging
//
- (void) trace:(NSString*)logString;


@end
