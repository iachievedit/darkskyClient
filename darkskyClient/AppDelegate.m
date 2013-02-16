//
//  AppDelegate.m
//  darkskyClient
//
//  Created by Joseph Bell on 2/11/13.
//  Copyright (c) 2013 iAchieved.it LLC. All rights reserved.
//

#import "AppDelegate.h"

#import "Constants.h"
#import "Logging.h"
#import "DDTTYLogger.h"

#ifdef DEBUG
static const int ddLogLevel = LOG_LEVEL_VERBOSE;
#else
static const int ddLogLevel = LOG_LEVEL_INFO;
#endif

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

  [DDLog addLogger:[DDTTYLogger sharedInstance]];
  
  ENTRY_LOG;
  
  if ([DARKSKY_API_KEY isEqualToString:NO_DARKSKY_KEY_DEFINED]) {
    DDLogError(@"ERROR:  You haven't defined a valid DarkSky API Key!");
    return YES;
  }

  NSString* interestingStorms = [NSString stringWithFormat:@"%@/%@", DARKSKY_INTERESTING_STORMS, DARKSKY_API_KEY];
  
  DDLogVerbose(@"Using DarkSky API Endpoint:  %@", interestingStorms);

  dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
    NSError* error;
    
    NSString* interestingStormData = [NSString stringWithContentsOfURL:[NSURL URLWithString:interestingStorms]
                                                encoding:NSUTF8StringEncoding
                                                   error:&error];
    DDLogInfo(@"API returned:  %@", interestingStormData);
  });
  
  EXIT_LOG;
  return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
  // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
  // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
  // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
  // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
  // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
  // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
  // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
