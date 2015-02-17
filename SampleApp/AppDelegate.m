//
//  AppDelegate.m
//  SampleApp
//
//  Created by Daniel Stepanov on 2/16/15.
//  Copyright (c) 2015 Daniel Stepanov. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate



- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    // This method runs right after the application finishes launching
    
    // 0. Initialize the window; it's a strong property, defined in this class (see header file).
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    // 1. Allocates memory for an instance of the 'ViewController' class
    ViewController *rootViewController = [[ViewController alloc] init];
    
    // 2. Use a UINavigationController, since things get wonkey when VC's don't have "Parent" view controllers.
    // NOTE: you could also make this a property of AppDelegate to do hacky pushing of VC's / quick stuff later.
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:rootViewController];
    
    // 3. If you want to customize the navigationConttroller, e.g. whether the navigationBar is visible, do it here.
    [navigationController setNavigationBarHidden:YES animated:YES];
    
    // 4. set the rootViewController property of the Application's window
    // (Some UIApplication (probably?) object has a weak reference to our self.window)
    self.window.rootViewController = navigationController;
    
    // You can add windows if I believe correctly, but you typically do so in implementing UIAlertBox's, which are just UIView's
    // Having multiple ViewController's on the same screen at the same time involves implementing a "Parent" view controller.
    // You also typically would not do that in this method.
    
    // 5. Apple header file says for -[UIWindow makeKeyAndVisible]
    //   > convenience. most apps call this to show the main window
    //   > and also make it key. otherwise use view hidden property
    // so this makes this window key (i.e. receive touch events, rather than an alert box which becomes Key when on screen)
    // and also sets the visible property.
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
