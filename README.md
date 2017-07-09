# bazeltrunk
Reproduces a compile error encountered when building glog with gflags support with Bazel

Steps to reproduce the error:

git clone https://github.com/dionescu/bazeltrunk.git
bazel build //external:glog

You should see an error similar to the one below:

In file included from external/glog_archive/src/utilities.h:73:0,
                 from external/glog_archive/src/raw_logging.cc:34:
external/glog_archive/src/base/mutex.h:147:3: error: #error Need to implement mutex.h for your architecture, or #define NO_THREADS
 # error Need to implement mutex.h for your architecture, or #define NO_THREADS
   ^
In file included from external/glog_archive/src/utilities.h:73:0,
                 from external/glog_archive/src/raw_logging.cc:34:
external/glog_archive/src/base/mutex.h:188:3: error: 'MutexType' does not name a type
   MutexType mutex_;
   ^
In file included from external/glog_archive/src/raw_logging.cc:34:0:
external/glog_archive/src/utilities.h:137:1: error: '_START_GOOGLE_NAMESPACE_' does not name a type
 _START_GOOGLE_NAMESPACE_
 ^
external/glog_archive/src/utilities.h:222:1: error: '_END_GOOGLE_NAMESPACE_' does not name a type
 _END_GOOGLE_NAMESPACE_
 ^
external/glog_archive/src/raw_logging.cc:69:1: error: '_START_GOOGLE_NAMESPACE_' does not name a type
 _START_GOOGLE_NAMESPACE_

