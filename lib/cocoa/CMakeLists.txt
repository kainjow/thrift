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

# Create the thrift Cocoa library
set(thriftcocoa_SOURCES
	src/protocol/TBase.h
	src/protocol/TBinaryProtocol.h
	src/protocol/TBinaryProtocol.m
	src/protocol/TCompactProtocol.h
	src/protocol/TCompactProtocol.m
	src/protocol/TMultiplexedProtocol.h
	src/protocol/TMultiplexedProtocol.m
	src/protocol/TProtocol.h
	src/protocol/TProtocolDecorator.h
	src/protocol/TProtocolDecorator.m
	src/protocol/TProtocolError.h
	src/protocol/TProtocolError.m
	src/protocol/TProtocolFactory.h
	src/protocol/TProtocolUtil.h
	src/protocol/TProtocolUtil.m
	src/TApplicationError.h
	src/TApplicationError.m
	src/TBaseClient.h
	src/TBaseClient.m
	src/TError.h
	src/TError.m
	src/Thrift.h
	src/TProcessor.h
	src/TProcessorFactory.h
	src/transport/TAsyncTransport.h
	src/transport/TFramedTransport.h
	src/transport/TFramedTransport.m
	src/transport/THTTPSessionTransport.h
	src/transport/THTTPSessionTransport.m
	src/transport/THTTPTransport.h
	src/transport/THTTPTransport.m
	src/transport/TMemoryBuffer.h
	src/transport/TMemoryBuffer.m
	src/transport/TNSFileHandleTransport.h
	src/transport/TNSFileHandleTransport.m
	src/transport/TNSStreamTransport.h
	src/transport/TNSStreamTransport.m
	src/transport/TSocketTransport.h
	src/transport/TSocketTransport.m
	src/transport/TSSLSocketTransport.h
	src/transport/TSSLSocketTransport.m
	src/transport/TSSLSocketTransportError.h
	src/transport/TSSLSocketTransportError.m
	src/transport/TTransport.h
	src/transport/TTransportError.h
	src/transport/TTransportError.m
	src/transport/TTransportFactory.h
	src/TSharedProcessorFactory.h
	src/TSharedProcessorFactory.m
	src/server/TSocketServer.h
	src/server/TSocketServer.m
)

include_directories(
    src
    src/protocol
    src/transport
    src/server
)

add_definitions(
    -fobjc-arc
)

if(NOT CMAKE_OSX_DEPLOYMENT_TARGET)
    set(CMAKE_OSX_DEPLOYMENT_TARGET 10.11)
endif()

add_library_thrift(thriftcocoa ${thriftcocoa_SOURCES})

target_link_libraries(thriftcocoa
    "-framework CFNetwork"
    "-framework Security"
)
