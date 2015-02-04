//
//  UIViewController+Navigation.m
//  Everpobre
//
//  Created by Vicente Oliva de la Serna on 4/2/15.
//  Copyright (c) 2015 Vicente Oliva de la Serna. All rights reserved.
//

#import "UIViewController+Navigation.h"

@implementation UIViewController (Navigation)

-(UINavigationController *) vosWrappedInNavigation{
    UINavigationController * nav = [UINavigationController new];
    
    [nav pushViewController:self animated:NO];
    
    return nav;
    
}

@end
