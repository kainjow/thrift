/*
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements. See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership. The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License. You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied. See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */

#import "TSocketServer.h"
#import "TSharedProcessorFactory.h"
#import "TBinaryProtocol.h"
#import "TCompactProtocol.h"
#import "TApplicationError.h"

#include "../gen-cocoa/ThriftTestThriftTest.h"

#import <getopt.h>

@interface Service : NSObject <ThriftTestThriftTest>

@end

@implementation Service

- (BOOL) testVoid: (NSError *__autoreleasing *)__thriftError {
	NSLog(@"%s", __PRETTY_FUNCTION__);
	printf("testVoid()\n");
	return YES;
}

- (NSString *) testString: (NSString *) thing error: (NSError *__autoreleasing *)__thriftError {
	NSLog(@"%s", __PRETTY_FUNCTION__);
	return thing;
}

- (NSNumber *) testBool: (BOOL) thing error: (NSError *__autoreleasing *)__thriftError {
	NSLog(@"%s", __PRETTY_FUNCTION__);
	return @(thing);
}

- (NSNumber *) testByte: (SInt8) thing error: (NSError *__autoreleasing *)__thriftError {
	NSLog(@"%s", __PRETTY_FUNCTION__);
	return @(thing);
}

- (NSNumber *) testI32: (SInt32) thing error: (NSError *__autoreleasing *)__thriftError {
	NSLog(@"%s", __PRETTY_FUNCTION__);
	return @(thing);
}

- (NSNumber *) testI64: (SInt64) thing error: (NSError *__autoreleasing *)__thriftError {
	NSLog(@"%s", __PRETTY_FUNCTION__);
	return @(thing);
}

- (NSNumber *) testDouble: (double) thing error: (NSError *__autoreleasing *)__thriftError {
	NSLog(@"%s", __PRETTY_FUNCTION__);
	return @(thing);
}

- (NSData *) testBinary: (NSData *) thing error: (NSError *__autoreleasing *)__thriftError {
	NSLog(@"%s", __PRETTY_FUNCTION__);
	return thing;
}

- (ThriftTestXtruct *) testStruct: (ThriftTestXtruct *) thing error: (NSError *__autoreleasing *)__thriftError {
	NSLog(@"%s", __PRETTY_FUNCTION__);
	return thing;
}

- (ThriftTestXtruct2 *) testNest: (ThriftTestXtruct2 *) thing error: (NSError *__autoreleasing *)__thriftError {
	NSLog(@"%s", __PRETTY_FUNCTION__);
	return thing;
}

- (NSDictionary<NSNumber *, NSNumber *> *) testMap: (NSDictionary<NSNumber *, NSNumber *> *) thing error: (NSError *__autoreleasing *)__thriftError {
	NSLog(@"%s", __PRETTY_FUNCTION__);
	return thing;
}

- (NSDictionary<NSString *, NSString *> *) testStringMap: (NSDictionary<NSString *, NSString *> *) thing error: (NSError *__autoreleasing *)__thriftError {
	NSLog(@"%s", __PRETTY_FUNCTION__);
	return thing;
}

- (NSSet<NSNumber *> *) testSet: (NSSet<NSNumber *> *) thing error: (NSError *__autoreleasing *)__thriftError {
	NSLog(@"%s", __PRETTY_FUNCTION__);
	return thing;
}

- (NSArray<NSNumber *> *) testList: (NSArray<NSNumber *> *) thing error: (NSError *__autoreleasing *)__thriftError {
	NSLog(@"%s", __PRETTY_FUNCTION__);
	return thing;
}

- (NSNumber *) testEnum: (ThriftTestNumberz) thing error: (NSError *__autoreleasing *)__thriftError {
	NSLog(@"%s", __PRETTY_FUNCTION__);
	return @(thing);
}

- (NSNumber *) testTypedef: (ThriftTestUserId) thing error: (NSError *__autoreleasing *)__thriftError {
	NSLog(@"%s", __PRETTY_FUNCTION__);
	return @(thing);
}

- (NSDictionary<NSNumber *, NSDictionary<NSNumber *, NSNumber *> *> *) testMapMap: (SInt32) hello error: (NSError *__autoreleasing *)__thriftError {
	NSLog(@"%s", __PRETTY_FUNCTION__);
	NSDictionary<NSNumber *, NSDictionary<NSNumber *, NSNumber *> *> *result = @{
		@(-4): @{
			@(-4): @(-4),
			@(-3): @(-3),
			@(-2): @(-2),
			@(-1): @(-1),
		},
		@(4): @{
			@(1): @(1),
			@(2): @(2),
			@(3): @(3),
			@(4): @(4),
		},
	};
	return result;
}

- (NSDictionary<NSNumber *, NSDictionary<NSNumber *, ThriftTestInsanity *> *> *) testInsanity: (ThriftTestInsanity *) argument error: (NSError *__autoreleasing *)__thriftError {
	NSLog(@"%s", __PRETTY_FUNCTION__);
	NSDictionary<NSNumber *, NSDictionary<NSNumber *, ThriftTestInsanity *> *> *result = @{
		@(1): @{
			@(2): argument,
			@(3): argument,
		},
		@(2): @{
			@(6): [[ThriftTestInsanity alloc] init],
		},
	};
	return result;
}

- (ThriftTestXtruct *) testMulti: (SInt8) arg0 arg1: (SInt32) arg1 arg2: (SInt64) arg2 arg3: (NSDictionary<NSNumber *, NSString *> *) arg3 arg4: (ThriftTestNumberz) arg4 arg5: (ThriftTestUserId) arg5 error: (NSError *__autoreleasing *)__thriftError {
	NSLog(@"%s", __PRETTY_FUNCTION__);
	return [[ThriftTestXtruct alloc] initWithString_thing:@"Hello2" byte_thing:arg0 i32_thing:arg1 i64_thing:arg2];
}

- (BOOL) testException: (NSString *) arg error: (NSError *__autoreleasing *)__thriftError {
	NSLog(@"%s: %@", __PRETTY_FUNCTION__, arg);
	if ([arg isEqualToString:@"Xception"]) {
		*__thriftError = [[ThriftTestXception alloc] initWithErrorCode:1001 message:arg];
	} else if ([arg isEqualToString:@"TException"]) {
		*__thriftError = [NSError errorWithMessage:arg];
	}
	return YES;
}

- (ThriftTestXtruct *) testMultiException: (NSString *) arg0 arg1: (NSString *) arg1 error: (NSError *__autoreleasing *)__thriftError {
	NSLog(@"%s", __PRETTY_FUNCTION__);
	if ([arg0 isEqualToString:@"Xception"]) {
		*__thriftError = [[ThriftTestXception alloc] initWithErrorCode:1001 message:@"This is an Xception"];
	} else if ([arg0 isEqualToString:@"Xception2"]) {
		ThriftTestXtruct *struct_thing = [[ThriftTestXtruct alloc] init];
		struct_thing.string_thing = @"This is an Xception2";
		*__thriftError = [[ThriftTestXception2 alloc] initWithErrorCode:2002 struct_thing:struct_thing];
	}
	return [[ThriftTestXtruct alloc] initWithString_thing:arg1 byte_thing:0 i32_thing:0 i64_thing:0];
}

- (BOOL) testOneway: (SInt32) secondsToSleep error: (NSError *__autoreleasing *)__thriftError {
	NSLog(@"%s", __PRETTY_FUNCTION__);
	sleep(secondsToSleep);
	return YES;
}

@end

@interface App : NSObject

@property NSString *protocol;
@property NSString *transport;
@property int port;
@property NSString *path;
@property TSocketServer *server;

@end

@implementation App

- (BOOL)parseArgs:(int)argc argv:(char **)argv {
	// Configure and parse the command-line options
	const struct option long_options[] = {
		{"protocol", required_argument, NULL, 'p'},
		{"transport", required_argument, NULL, 't'},
		{"port", required_argument, NULL, 'r'},
		{"domain-path", required_argument, NULL, 'd'},
		{NULL, 0, NULL, 0},
	};

	int ch;
	while ((ch = getopt_long(argc, argv, "p:t:r:d:", long_options, NULL)) != -1) {
		switch(ch) {
			case 'p':
				self.protocol = [[NSString alloc] initWithUTF8String:optarg];
				break;
			case 't':
				self.transport = [[NSString alloc] initWithUTF8String:optarg];
				break;
			case 'r':
				self.port = atoi(optarg);
				break;
			case 'd':
				self.path = [[NSString alloc] initWithUTF8String:optarg];
				break;
			default:
				break;
		}
	}

	printf("Protocol:  %s\n", self.protocol.UTF8String);
	printf("Transport: %s\n", self.transport.UTF8String);
	printf("Port:      %d\n", self.port);
	printf("Path:      %s\n", self.path.UTF8String);

	NSSet<NSString *> *supportedProtocols = [NSSet setWithObjects:
		@"binary",
		@"compact",
		nil
	];
	if (![supportedProtocols containsObject:self.protocol]) {
		NSLog(@"Unknown protocol type %@", self.protocol);
		return NO;
	}

	if (![self.transport isEqualToString:@"buffered"]) {
		NSLog(@"Unknown transport type %@", self.transport);
		return NO;
	}

	return YES;
}

- (int)main:(int)argc argv:(char **)argv {
	if (![self parseArgs:argc argv:argv]) {
		return EXIT_FAILURE;
	}

	Service *service = [[Service alloc] init];
	ThriftTestThriftTestProcessor *processor = [[ThriftTestThriftTestProcessor alloc] initWithThriftTest:service];
	TSharedProcessorFactory *processorFactory = [[TSharedProcessorFactory alloc] initWithSharedProcessor:processor];
	id<TProtocolFactory> protocolFactory = nil;
	if ([self.protocol isEqualToString:@"binary"]) {
		protocolFactory = [[TBinaryProtocolFactory alloc] init];
	} else if ([self.protocol isEqualToString:@"compact"]) {
		protocolFactory = [[TCompactProtocolFactory alloc] init];
	}
	if (self.path) {
		NSLog(@"Starting server (%@/%@) listen on: %@",
			self.transport,
			self.protocol,
			self.path);
		self.server = [[TSocketServer alloc] initWithPath:self.path protocolFactory:protocolFactory processorFactory:processorFactory];
	} else {
		NSLog(@"Starting server (%@/%@) listen on: %d\n",
			self.transport,
			self.protocol,
			self.port);
		self.server = [[TSocketServer alloc] initWithPort:self.port protocolFactory:protocolFactory processorFactory:processorFactory];
	}

	[NSRunLoop.currentRunLoop run];

	return EXIT_SUCCESS;
}

@end

int main(int argc, char **argv) {
	App *app = [[App alloc] init];
	return [app main:argc argv:argv];
}
