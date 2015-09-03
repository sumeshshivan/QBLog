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
  * Error log messages - `QBLogError(@"Error log message");`
  * Warning log messages - `QBLogWarning(@"Warning log message");`
  * Trace log messages - `QBLogTrace(@"Trace log message");`
  * Debug log messages - `QBLogDebug(@"Debug log message");`
  

###Log files

* Log files are created on each day with date as file name inside Logs folder under the application's Documents directory.
* To clear old log files call `QBLogClear(days);`. The log files  prior to that number of days from the present date are deleted.

For example:
`QBLogClear(2);` clears log files before 2 days.