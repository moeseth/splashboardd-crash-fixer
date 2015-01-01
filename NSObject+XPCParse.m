//
//  NSObject+XPCParse.m
//  XPCKit
//
//  Created by Steve Streza on 7/25/11. Copyright 2011 XPCKit.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

#import "NSObject+XPCParse.h"
#import "NSString+XPCParse.h"
#import <xpc/xpc.h>

@implementation NSObject (XPCParse)

+(id)objectWithXPCObject:(xpc_object_t)xpcObject{
    id object = nil;
    xpc_type_t type = xpc_get_type(xpcObject);
	
	if(type == XPC_TYPE_STRING){
        object = [NSString stringWithXPCObject:xpcObject];
		NSLog(@"****** ====");
	} else {
		NSLog(@"****** !====");
	}
	
    return object;
}

@end
