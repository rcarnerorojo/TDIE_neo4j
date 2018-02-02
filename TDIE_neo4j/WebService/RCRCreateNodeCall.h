//
//  RCRCreateNodeCall.h
//  TDIE_neo4j
//
//  Created by Ramón Carnero on 2/2/18.
//  Copyright © 2018 RCR. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

@interface RCRCreateNodeCall : NSObject

-(void)requestCreateNodeWithManager:(AFHTTPSessionManager*)manager
                         properties:(NSDictionary*)properties
              withCompletionHandler:(void (^)(NSMutableDictionary *result, NSError *error))completionHandler;


@end
