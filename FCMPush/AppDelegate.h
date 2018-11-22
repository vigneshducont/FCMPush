//
//  AppDelegate.h
//  FCMPush
//
//  Created by Ducont India on 09/10/18.
//  Copyright © 2018 Ducont India. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Firebase.h"
#import <FirebaseMessaging/FirebaseMessaging.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate, FIRMessagingDelegate>

@property (strong, nonatomic) UIWindow *window;


@end

