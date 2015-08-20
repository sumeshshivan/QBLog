//
//  QBLogger.h
//  QBLog
//
//  Created by Mahesh M on 18/08/15.
//  Copyright (c) 2015 qburst. All rights reserved.
//

#import <Foundation/Foundation.h>

void QBLogError(NSString *str,...);
void QBLogWarning(NSString *str,...);
void QBLogInfo(NSString *str,...);
void QBLogTrace(NSString *str,...);
void QBLogDebug(NSString *str,...);