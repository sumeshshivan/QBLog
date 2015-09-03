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

//static QLogLevel p_logLevel = QLogLevel_DEBUG;
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
        
        _logLevel = QLogLevel_DEBUG;
        
        NSString *documentsDirectory = [NSSearchPathForDirectoriesInDomains (NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
        
        _logFolderPath = [documentsDirectory stringByAppendingPathComponent:logsFolder];
                
        _fileManager = [NSFileManager defaultManager];
        
        // Check if Logs directory in Documents folder exists.
        BOOL isDir;
        BOOL exists = [_fileManager fileExistsAtPath:_logFolderPath isDirectory:&isDir];
        
        // Create Logs directory in Documents folder if does not exists.
        if (!exists) {
            
            NSError *error = nil;
            [_fileManager createDirectoryAtPath:_logFolderPath withIntermediateDirectories:NO attributes:nil error:&error];
            
            // Exclude folder from backup to cloud
            NSURL *folderURL = [ NSURL fileURLWithPath: _logFolderPath ];
            [folderURL setResourceValue: [ NSNumber numberWithBool: YES ] forKey: NSURLIsExcludedFromBackupKey error: nil ];
            
        }
        NSLog(@"Log Folder : %@",_logFolderPath);
    }
    return self;
}



- (void) logWithLevel:(NSString*)level logMessage:logString
{
    
    NSData *data = nil;
    
    @try {
        
        // Create Log file for the date if it does not exists.
        [self createLogFile];
        
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        formatter.dateFormat = @"yyyy-MM-dd HH:mm:ss:SSS";
        [formatter setTimeZone:[NSTimeZone systemTimeZone]];
       
        NSString *time = [formatter stringFromDate:[NSDate date]];
        
        // Construct log message in the formate <yyyy-MM-dd> [Log Level] : Log message.
        NSString *dataString = [NSString stringWithFormat:@"<%@> [%@] : %@\n", time, level, logString];
        
        NSLog(@"[%@] %@",level,logString);
        
        // Append log message to the log file
        if ( !m_fh )
        {
            m_fh = [NSFileHandle fileHandleForWritingAtPath:_logFilePath];
        }
        
        [m_fh truncateFileAtOffset:[m_fh seekToEndOfFile]];
        data = [dataString dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
        [m_fh writeData:data];

    }
    @catch (NSException *exception) {
        NSLog(@"Log service Error exception");
    }
    @finally {
        data = nil;
    }
}

#pragma mark - Log File Create and Delete Methods

- (void)createLogFile {
    
    // Create title for log file from current date.
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"dd-MM-yyyy";
    NSString *date = [formatter stringFromDate:[NSDate date]];
    NSString *fileName = [NSString stringWithFormat:@"%@.txt",date];
    
    _logFilePath = [_logFolderPath stringByAppendingPathComponent:fileName];
    
    BOOL exists = [_fileManager fileExistsAtPath:_logFilePath];
    if (!exists) {
        [_fileManager createFileAtPath:_logFilePath contents:nil attributes:nil];
        m_fh = [NSFileHandle fileHandleForWritingAtPath:_logFilePath];
        
        // Exclude file from backup to cloud
        NSURL *fileURL = [ NSURL fileURLWithPath: _logFilePath ];
        [fileURL setResourceValue: [ NSNumber numberWithBool: YES ] forKey: NSURLIsExcludedFromBackupKey error: nil ];
    }
    
}

- (void) deleteLogsOlderThan:(NSInteger)days {
    
    // Delete all the old log files
    NSArray *dirContents = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:_logFolderPath error:nil];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"dd-MM-yyyy"];
    
    NSDate *deleteDate =[[NSDate date] dateByAddingTimeInterval:-1*days*24*60*60];
    
    for (NSString *fileName in dirContents) {
        
        // Remove file .txt extension
        NSString *dateString = [fileName substringToIndex:[fileName length] - 4];
        
        // Create date from file name.
        NSDate *fileDate = [dateFormatter dateFromString:dateString];
        
        if ([fileDate compare:deleteDate] == NSOrderedAscending) {
            
            NSString *filePath = [_logFolderPath stringByAppendingPathComponent:fileName];
            
            // Delete the log file
            NSError *error;
            [_fileManager removeItemAtPath:filePath error:&error];
        }
    }
}

#pragma  mark - Log Methods

- (void) info:(NSString*)logString
{
    if (_logLevel >= QLogLevel_INFO) {
        [self logWithLevel:@"INFO " logMessage:logString];
    }
}

- (void) warning:(NSString*)logString
{
    if (_logLevel >= QLogLevel_WARNING) {
        [self logWithLevel:@"WARN " logMessage:logString];
    }
}

- (void) error:(NSString*)logString
{
    if (_logLevel >= QLogLevel_ERROR) {
        [self logWithLevel:@"ERROR" logMessage:logString];
    }
}

- (void) debug:(NSString*)logString
{
    if (_logLevel >= QLogLevel_DEBUG) {
        [self logWithLevel:@"DEBUG" logMessage:logString];
    }
}

- (void) trace:(NSString*)logString
{
    if (_logLevel >= QLogLevel_TRACE) {
        [self logWithLevel:@"TRACE" logMessage:logString];
    }
}

#pragma mark - File backup exclude method

- (void)addSkipBackupAttributeToItemAtPath:(NSString *) filePathString
{
    NSURL* URL= [NSURL fileURLWithPath: filePathString];
    assert([[NSFileManager defaultManager] fileExistsAtPath: [URL path]]);
    
    NSError *error = nil;
    [URL setResourceValue: [NSNumber numberWithBool: YES] forKey: NSURLIsExcludedFromBackupKey error: &error];

}
@end
