//
//  QBLogService.m
//  QBLog
//
//  Created by Mahesh M on 17/08/15.
//  Copyright (c) 2015 qburst. All rights reserved.
//

#import "QBLogService.h"

@interface QBLogService ()
{
    NSFileHandle *m_fh;
    NSString* _logFolderPath;
    NSString* _logFilePath;
    NSFileManager *_fileManager;
}
@end

@implementation QBLogService

static QLogLevel p_logLevel = QLogLevel_DEBUG;
static NSString *logsFolder = @"Logs";

+ (QBLogService *)sharedInstance {
    static dispatch_once_t once;
    static QBLogService *instance;
    dispatch_once(&once, ^{
        instance = [[QBLogService alloc] init];
    });
    return instance;
}

- (id) init
{
    self = [super init];
    if (self) {
        
        // Create Logs directory in Documents folder if does not exists.
        NSString *documentsDirectory = [NSSearchPathForDirectoriesInDomains (NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
        
        _logFolderPath = [documentsDirectory stringByAppendingPathComponent:logsFolder];
        
        _fileManager = [NSFileManager defaultManager];
        BOOL isDir;
        BOOL exists = [_fileManager fileExistsAtPath:_logFolderPath isDirectory:&isDir];
        
        if (!exists) {
            NSError *error = nil;
            [[NSFileManager defaultManager] createDirectoryAtPath:_logFolderPath withIntermediateDirectories:NO attributes:nil error:&error];
        }
    }
    return self;
}

- (void) logWithLevel:(NSString*)level format:(NSString*)format, ...
{
    
    NSData *data = nil;
    
    @try {
        // Create Log file for the date if it does not exists.
        [self createLogFile];
       
        va_list args;
        va_start(args, format);
        NSString *logString = [[NSString alloc] initWithFormat:format arguments:args];
        
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        formatter.dateFormat = @"yyyy-MM-dd HH:mm:ss:SSS";
        [formatter setTimeZone:[NSTimeZone systemTimeZone]];
       
        NSString *time = [formatter stringFromDate:[NSDate date]];
        
        NSString *dataString = [NSString stringWithFormat:@"<%@> [%@] : %@\n", time, level, logString];
        
        NSLog(@"%@",logString);
        
        //append data to the file
        if ( !m_fh )
        {
            m_fh = [NSFileHandle fileHandleForWritingAtPath:_logFilePath];
        }
        
        [m_fh truncateFileAtOffset:[m_fh seekToEndOfFile]];
        data = [dataString dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
        [m_fh writeData:data];
        
        va_end(args);
    }
    @catch (NSException *exception) {
        NSLog(@"Log service Error exception");
    }
    @finally {
        data = nil;
    }
}

- (void)createLogFile {
    
    // Create title for log file from current date.
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"dd-MM-yyyy";
    NSString *date = [formatter stringFromDate:[NSDate date]];
    NSString *fileName = [NSString stringWithFormat:@"%@.txt",date];
    
    _logFilePath = [_logFolderPath stringByAppendingPathComponent:fileName];
    
    BOOL exists = [_fileManager fileExistsAtPath:_logFilePath];
    if (!exists) {
        [[NSFileManager defaultManager] createFileAtPath:_logFilePath contents:nil attributes:nil];
        m_fh = [NSFileHandle fileHandleForWritingAtPath:_logFilePath];
    }
    
}

#pragma  mark - Log Methods

- (void) info:(NSString*)format, ...
{
    if (p_logLevel >= QLogLevel_INFO) {
        [self logWithLevel:@"INFO " format:format];
    }
}

- (void) warning:(NSString*)format, ...
{
    if (p_logLevel >= QLogLevel_WARNING) {
        [self logWithLevel:@"WARN " format:format];
    }
}

- (void) error:(NSString*)format, ...
{
    if (p_logLevel >= QLogLevel_ERROR) {
        [self logWithLevel:@"ERROR" format:format];
    }
}

- (void) debug:(NSString*)format, ...
{
    if (p_logLevel >= QLogLevel_DEBUG) {
        [self logWithLevel:@"DEBUG" format:format];
    }
}

- (void) trace:(NSString*)format, ...
{
    if (p_logLevel >= QLogLevel_TRACE) {
        [self logWithLevel:@"TRACE" format:format];
    }
}

@end
