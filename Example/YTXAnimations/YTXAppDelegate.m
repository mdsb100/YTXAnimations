//
//  YTXAppDelegate.m
//  YTXAnimations
//
//  Created by lilonglong on 04/11/2016.
//  Copyright (c) 2016 lilonglong. All rights reserved.
//

#import "YTXAppDelegate.h"

#import "YTXTabBarViewController.h"
@interface YTXAppDelegate()

@property (nonnull, nonatomic, strong) YTXTabBarViewController *tabController;

@end

@implementation YTXAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    [self initRootViewController];
    
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

- (void) initRootViewController
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor blackColor];
    
    UIViewController *animateCSSViewController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"YTXAnimateCSSViewController"];
    animateCSSViewController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Animate.CSS"
                                                              image:[UIImage imageNamed:@"air_pilot_hat"]
                                                      selectedImage:[UIImage imageNamed:@"air_pilot_hat_filled"]];
    
    UIViewController *CSShakeViewController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"YTXCSShakeViewController"];
    CSShakeViewController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"CSSHake"
                                                                        image:[UIImage imageNamed:@"cocktail"]
                                                                selectedImage:[UIImage imageNamed:@"cocktail_filled"]];
    
    UIViewController *magicCSSViewController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"YTXMagicCSSViewController"];
    magicCSSViewController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Magic.CSS"
                                                                     image:[UIImage imageNamed:@"diamond"]
                                                             selectedImage:[UIImage imageNamed:@"diamond_filled"]];
    self.tabController.viewControllers = @[animateCSSViewController, CSShakeViewController, magicCSSViewController];
    self.window.rootViewController = self.tabController;
}

- (YTXTabBarViewController *) tabController
{
    if (_tabController == nil) {
        _tabController = [YTXTabBarViewController new];
        [_tabController.tabBar setTranslucent:NO];
    }
    return _tabController;
}

@end
