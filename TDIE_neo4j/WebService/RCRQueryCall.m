//
//  RCRQueryCall.m
//  TDIE_neo4j
//
//  Created by Ramón Carnero on 2/2/18.
//  Copyright © 2018 RCR. All rights reserved.
//

#import "RCRQueryCall.h"
#import "AFNetworking.h"

@implementation RCRQueryCall

-(void)requestQueryWithManager:(AFHTTPSessionManager*)manager
                         query:(NSString*)query
         withCompletionHandler:(void (^)(NSMutableDictionary *result, NSError *error))completionHandler{
    
    NSURL *url = [NSURL URLWithString:@"/db/data/cypher"];
    
    NSMutableDictionary * parameters = [[NSMutableDictionary alloc]init];
    [parameters setObject:query forKey:@"query"];
    [manager POST:[url absoluteString]
       parameters:parameters
         progress:nil
          success:^(NSURLSessionTask *task, id responseObject) {
              completionHandler(responseObject, nil);
          }
          failure:^(NSURLSessionTask *operation, NSError *error) {
              completionHandler(nil, error);
          }];
}

@end
