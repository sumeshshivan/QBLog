QBLog
===============

A fast &amp; simple logging to file framework for iOS

##Installation

- Drag the `QBLog` folder into your project.
- `#import "QBLogger.h"` where appropriate. 

###Usage

* Set Log Level to one of the following levels
  * QLogLevel_NONE
  * QLogLevel_ERROR
  * QLogLevel_WARNING
  * QLogLevel_INFO
  * QLogLevel_TRACE
  * QLogLevel_DEBUG
 
By default Log Level is set to QLogLevel_INFO.
 
For example:
  QBLogSetLevel(QLogLevel_DEBUG);
  

* Then change your NSlog messages to one of the follwing accordingly
  * QBLogInfo(@"Info log message");
  * QBLogError(@"Error log message");
  * QBLogWarning(@"Warning log message");
  * QBLogTrace(@"Trace log message");
  * QBLogDebug(@"Debug log message");
  


