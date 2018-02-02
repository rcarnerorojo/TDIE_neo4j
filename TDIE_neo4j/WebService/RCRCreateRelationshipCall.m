//
//  RCRCreateRelationshipCall.m
//  TDIE_neo4j
//
//  Created by Ramón Carnero on 2/2/18.
//  Copyright © 2018 RCR. All rights reserved.
//

#import "RCRCreateRelationshipCall.h"
#import "AFNetworking.h"

@implementation RCRCreateRelationshipCall

-(void)requestCreateRelationshipWithManager:(AFHTTPSessionManager*)manager
                                  firstNode:(NSString*)firstNode
                                 secondNode:(NSString*)secondNode
                               relationship:(NSString*)relationship
                      withCompletionHandler:(void (^)(NSMutableDictionary *result, NSError *error))completionHandler{
    
    NSLog(@"urlllsda %@",manager.baseURL.absoluteString);
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"/db/data/node/%@/relationships",firstNode]];
    
    NSString *ulrSecondNode = [NSString stringWithFormat:@"%@/db/data/node/%@",manager.baseURL.absoluteString,secondNode];
    
    NSMutableDictionary * parameters = [[NSMutableDictionary alloc]init];
    [parameters setObject:ulrSecondNode forKey:@"to"];
    [parameters setObject:relationship forKey:@"type"];
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
