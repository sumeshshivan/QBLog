QBLog
===============

A fast &amp; simple logging to file framework for iOS

##Installation

- Drag the `QBLog` folder into your project.
- `#import "QBLogger.h"` where appropriate. 

##Usage

- Set Log Level to one of the following levels.     
- QLogLevel_NONE      = -1
- QLogLevel_ERROR     = 0
- QLogLevel_WARNING   = 1
- QLogLevel_INFO      = 2
- QLogLevel_TRACE     = 3
- QLogLevel_DEBUG     = 4

By default Log Level is set to QLogLevel_INFO.

  For example:
  QBLogSetLevel(QLogLevel_DEBUG);
  
- Then change your NSlog messages to one of the follwing accordingly.
  


