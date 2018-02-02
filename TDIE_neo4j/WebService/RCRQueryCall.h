//
//  RCRQueryCall.h
//  TDIE_neo4j
//
//  Created by Ramón Carnero on 2/2/18.
//  Copyright © 2018 RCR. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

@interface RCRQueryCall : NSObject

-(void)requestQueryWithManager:(AFHTTPSessionManager*)manager
                               query:(NSString*)query
               withCompletionHandler:(void (^)(NSMutableDictionary *result, NSError *error))completionHandler;


@end
