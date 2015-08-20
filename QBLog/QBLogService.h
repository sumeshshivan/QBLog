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

+ (QBLogService *)sharedInstance;

//
// Information Logging
//
- (void) info:(NSString*)format, ...;

//
// Warning Logging
//
- (void) warning:(NSString*)format, ...;

//
// Error Logging
//
- (void) error:(NSString*)format, ...;

//
// Debug items Logging
//
- (void) debug:(NSString*)format, ...;

//
// Trace Logging
//
- (void) trace:(NSString*)format, ...;

@end
