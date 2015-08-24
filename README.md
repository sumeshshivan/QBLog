QBLog
===============

A fast &amp; simple logging to file framework for iOS

##Installation

- Copy the `QBLogger` folder into your project.
- `#import "QBLogger.h"` where appropriate. 

###Usage

* Set Log Level to one of the following levels
  * `QLogLevel_NONE`
  * `QLogLevel_ERROR`
  * `QLogLevel_WARNING`
  * `QLogLevel_INFO`
  * `QLogLevel_TRACE`
  * `QLogLevel_DEBUG`
 
For example:
  `QBLogSetLevel(QLogLevel_DEBUG);`
  
By default Log Level is set to QLogLevel_INFO.

* Then change your NSlog messages accordingly
  * Info log messages - `QBLogInfo(@"Info log message");`
  * Error log messges - `QBLogError(@"Error log message");`
  * Warning log messges - `QBLogWarning(@"Warning log message");`
  * Trace log messges - `QBLogTrace(@"Trace log message");`
  * Debug log messges - `QBLogDebug(@"Debug log message");`
  

###Log files

* Log files are created on each day with date as file name inside Logs folder under the application's Documents directory.