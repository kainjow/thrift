#
# Licensed to the Apache Software Foundation (ASF) under one
# or more contributor license agreements. See the NOTICE file
# distributed with this work for additional information
# regarding copyright ownership. The ASF licenses this file
# to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance
# with the License. You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied. See the License for the
# specific language governing permissions and limitations
# under the License.
#
AUTOMAKE_OPTIONS = subdir-objects serial-tests nostdinc

precross: TestServer

check_PROGRAMS = \
	TestServer

TestServer_SOURCES = \
	src/TestServer.m \
	gen-cocoa/ThriftTestThriftTest.m \
	$(top_srcdir)/lib/cocoa/src/TApplicationError.m \
	$(top_srcdir)/lib/cocoa/src/TBaseClient.m \
	$(top_srcdir)/lib/cocoa/src/TError.m \
	$(top_srcdir)/lib/cocoa/src/TSharedProcessorFactory.m \
	$(top_srcdir)/lib/cocoa/src/protocol/TBinaryProtocol.m \
	$(top_srcdir)/lib/cocoa/src/protocol/TProtocolError.m \
	$(top_srcdir)/lib/cocoa/src/protocol/TProtocolUtil.m \
	$(top_srcdir)/lib/cocoa/src/server/TSocketServer.m \
	$(top_srcdir)/lib/cocoa/src/transport/TNSFileHandleTransport.m \
	$(top_srcdir)/lib/cocoa/src/transport/TTransportError.m

gen-cocoa/ThriftTestThriftTest.m gen-cocoa/ThriftTestThriftTest.h: $(top_srcdir)/test/ThriftTest.thrift $(THRIFT)
	$(THRIFT) --gen cocoa -r $<

AM_CPPFLAGS = -Wall -Wextra \
	-fobjc-arc \
	-mmacosx-version-min=10.11 \
	-Igen-cocoa \
	-I$(top_srcdir)/lib/cocoa/src \
	-I$(top_srcdir)/lib/cocoa/src/protocol \
	-I$(top_srcdir)/lib/cocoa/src/server \
	-I$(top_srcdir)/lib/cocoa/src/transport

AM_LDFLAGS = \
	-framework Foundation \
	@GCOV_LDFLAGS@

clean-local:
	$(RM) gen-cocoa/*
