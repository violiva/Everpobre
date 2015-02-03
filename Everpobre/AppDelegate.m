//
//  AppDelegate.m
//  Everpobre
//
//  Created by Vicente Oliva de la Serna on 2/2/15.
//  Copyright (c) 2015 Vicente Oliva de la Serna. All rights reserved.
//

#import "AppDelegate.h"
#import "VOSCoreDataStack.h"
#import "VOSNote.h"
#import "VOSNotebook.h"
#import "VOSPhotoContainer.h"

@interface AppDelegate ()

@property(nonatomic,strong) VOSCoreDataStack * stack;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    // creamos el stack
    self.stack = [VOSCoreDataStack coreDataStackWithModelName:@"Model"];
    
    // Llamada a la creación de datos chorras
    [self createDummyData];
    
    //
    [self trastearConDatos];
    
    
    
    
    
    
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
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


-(void)createDummyData{
    // primero borramos todo lo que haya
    [self.stack zapAllData];
    
    
    VOSNotebook * nb = [VOSNotebook notebookWithName:@"Ex-novias para el recuerdo"
                                             context:self.stack.context];
    
    [VOSNote noteWithName:@"Mariana Dávalos"
                 notebook:nb
                  context:self.stack.context];
    
    [VOSNote noteWithName:@"Camila Dávalos"
                 notebook:nb
                  context:self.stack.context];
    
    [VOSNote noteWithName:@"Pampita"
                 notebook:nb
                  context:self.stack.context];
    
}


-(void) trastearConDatos{
    VOSNotebook * apps = [VOSNotebook notebookWithName:@"Ideas de Apps"
                                               context:self.stack.context];
    VOSNote * iCachete = [VOSNote noteWithName:@"iCachete"
                                      notebook:apps
                                       context:self.stack.context];
    
    // Comprobamos que la modificationDate se actualiza
    NSLog(@"Antes: %@", iCachete.modificationDate);

    iCachete.text = @"App educativa para reforzar la coordinación motora fina y los reflejos";
    
    NSLog(@"Después: %@", iCachete.modificationDate);
    
    
}

@end
