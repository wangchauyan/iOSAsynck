//
//  iOSAsynck.h
//  iOSAsynck
//
//  Created by Chauyan Wang on 10/30/14.
//  Copyright (c) 2014 WCY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface iOSAsynck : NSObject


- (void) executeParams : (NSArray*) params;
- (void) preExcute;
- (id) doInBackground : (NSArray*) params;
- (void) postExcute : (id) result;

@end
