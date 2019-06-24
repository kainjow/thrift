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

#include "../gen-cocoa/ThriftTestThriftTest.h"

#import <getopt.h>

@interface Service : NSObject <ThriftTestThriftTest>

@end

@implementation Service

- (BOOL) testVoid: (NSError *__autoreleasing *)__thriftError {
	printf("testVoid()\n");
	return YES;
}

- (NSString *) testString: (NSString *) thing error: (NSError *__autoreleasing *)__thriftError {
	return nil;
}

- (NSNumber *) testBool: (BOOL) thing error: (NSError *__autoreleasing *)__thriftError {
	return nil;
}

- (NSNumber *) testByte: (SInt8) thing error: (NSError *__autoreleasing *)__thriftError {
	return nil;
}

- (NSNumber *) testI32: (SInt32) thing error: (NSError *__autoreleasing *)__thriftError {
	return nil;
}

- (NSNumber *) testI64: (SInt64) thing error: (NSError *__autoreleasing *)__thriftError {
	return nil;
}

- (NSNumber *) testDouble: (double) thing error: (NSError *__autoreleasing *)__thriftError {
	return nil;
}

- (NSData *) testBinary: (NSData *) thing error: (NSError *__autoreleasing *)__thriftError {
	return nil;
}

- (ThriftTestXtruct *) testStruct: (ThriftTestXtruct *) thing error: (NSError *__autoreleasing *)__thriftError {
	return nil;
}

- (ThriftTestXtruct2 *) testNest: (ThriftTestXtruct2 *) thing error: (NSError *__autoreleasing *)__thriftError {
	return nil;
}

- (NSDictionary<NSNumber *, NSNumber *> *) testMap: (NSDictionary<NSNumber *, NSNumber *> *) thing error: (NSError *__autoreleasing *)__thriftError {
	return nil;
}

- (NSDictionary<NSString *, NSString *> *) testStringMap: (NSDictionary<NSString *, NSString *> *) thing error: (NSError *__autoreleasing *)__thriftError {
	return nil;
}

- (NSSet<NSNumber *> *) testSet: (NSSet<NSNumber *> *) thing error: (NSError *__autoreleasing *)__thriftError {
	return nil;
}

- (NSArray<NSNumber *> *) testList: (NSArray<NSNumber *> *) thing error: (NSError *__autoreleasing *)__thriftError {
	return nil;
}

- (NSNumber *) testEnum: (ThriftTestNumberz) thing error: (NSError *__autoreleasing *)__thriftError {
	return nil;
}

- (NSNumber *) testTypedef: (ThriftTestUserId) thing error: (NSError *__autoreleasing *)__thriftError {
	return nil;
}

- (NSDictionary<NSNumber *, NSDictionary<NSNumber *, NSNumber *> *> *) testMapMap: (SInt32) hello error: (NSError *__autoreleasing *)__thriftError {
	return nil;
}

- (NSDictionary<NSNumber *, NSDictionary<NSNumber *, ThriftTestInsanity *> *> *) testInsanity: (ThriftTestInsanity *) argument error: (NSError *__autoreleasing *)__thriftError {
	return nil;
}

- (ThriftTestXtruct *) testMulti: (SInt8) arg0 arg1: (SInt32) arg1 arg2: (SInt64) arg2 arg3: (NSDictionary<NSNumber *, NSString *> *) arg3 arg4: (ThriftTestNumberz) arg4 arg5: (ThriftTestUserId) arg5 error: (NSError *__autoreleasing *)__thriftError {
	return nil;
}

- (BOOL) testException: (NSString *) arg error: (NSError *__autoreleasing *)__thriftError {
	return NO;
}

- (ThriftTestXtruct *) testMultiException: (NSString *) arg0 arg1: (NSString *) arg1 error: (NSError *__autoreleasing *)__thriftError {
	return nil;
}

- (BOOL) testOneway: (SInt32) secondsToSleep error: (NSError *__autoreleasing *)__thriftError {
	return NO;
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

	if (![self.protocol isEqualToString:@"binary"]) {
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
	id<TProtocolFactory> protocolFactory;
	if ([self.protocol isEqualToString:@"binary"]) {
		protocolFactory = [[TBinaryProtocolFactory alloc] init];
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
