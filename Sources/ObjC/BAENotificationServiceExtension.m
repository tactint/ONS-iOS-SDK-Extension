//
//  BAENotificationServiceExtension.m
//  ONSExtension
//
//  Copyright © 2019 Batch. All rights reserved.
//

#import "BAENotificationServiceExtension.h"

#if __has_include("ONSExtension-Swift.h")
#import "ONSExtension-Swift.h"
#else
#import <ONSExtension/ONSExtension-Swift.h>
#endif

@implementation BAENotificationServiceExtension
{
    BAERichNotificationHelper *_richNotificationHelper;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _richNotificationHelper = [BAERichNotificationHelper new];
    }
    return self;
}

- (void)didReceiveNotificationRequest:(UNNotificationRequest *)request withContentHandler:(void (^)(UNNotificationContent *contentToDeliver))contentHandler
{
    [_richNotificationHelper didReceiveNotificationRequest:request withContentHandler:contentHandler];
}

- (void)serviceExtensionTimeWillExpire
{
    [_richNotificationHelper serviceExtensionTimeWillExpire];
}

@end
