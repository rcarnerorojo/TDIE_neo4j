//
//  RCRCreateRelationshipCall.h
//  TDIE_neo4j
//
//  Created by Ramón Carnero on 2/2/18.
//  Copyright © 2018 RCR. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

@interface RCRCreateRelationshipCall : NSObject

-(void)requestCreateRelationshipWithManager:(AFHTTPSessionManager*)manager
                                  firstNode:(NSString*)firstNode
                                 secondNode:(NSString*)secondNode
                               relationship:(NSString*)relationship
                      withCompletionHandler:(void (^)(NSMutableDictionary *result, NSError *error))completionHandler;

@end
