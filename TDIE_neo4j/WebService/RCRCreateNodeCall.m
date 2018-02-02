//
//  RCRCreateNodeCall.m
//  TDIE_neo4j
//
//  Created by Ramón Carnero on 2/2/18.
//  Copyright © 2018 RCR. All rights reserved.
//

#import "RCRCreateNodeCall.h"
#import "AFNetworking.h"

@implementation RCRCreateNodeCall

-(void)requestCreateNodeWithManager:(AFHTTPSessionManager*)manager
                         properties:(NSDictionary*)properties
              withCompletionHandler:(void (^)(NSMutableDictionary *result, NSError *error))completionHandler{
    
    NSURL *url = [NSURL URLWithString:@"/db/data/node"];
    
    [manager POST:[url absoluteString]
       parameters:properties
         progress:nil
          success:^(NSURLSessionTask *task, id responseObject) {
              completionHandler(responseObject, nil);
          }
          failure:^(NSURLSessionTask *operation, NSError *error) {
              completionHandler(nil, error);
          }];
}

@end
