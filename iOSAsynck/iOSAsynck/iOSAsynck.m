//
//  iOSAsynck.m
//  iOSAsynck
//
//  Created by Chauyan Wang on 10/30/14.
//  Copyright (c) 2014 WCY. All rights reserved.
//

#import "iOSAsynck.h"

@implementation iOSAsynck


- (void) executeParams : (NSArray*) params {
    [self preExcute];
    __block id result;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        result = [self doInBackground:params];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self postExcute:result];
        });
    });
}

- (void) preExcute {
    // before doing something in background, we could use this function to update UI first.
}

- (id) doInBackground : (NSArray*) params {
    // run on other thread, not on UI thread !
    return nil;
}

- (void) postExcute : (id) result {
    // after finishing operation in background, we could use this function to update UI.
}
@end
