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
AUTOMAKE_OPTIONS = subdir-objects serial-tests

#noinst_LTLIBRARIES = libtestcglib.la
#nodist_libtestcglib_la_SOURCES = \
#	gen-c_glib/t_test_second_service.c \
#	gen-c_glib/t_test_second_service.h \
#	gen-c_glib/t_test_thrift_test.c \
#	gen-c_glib/t_test_thrift_test.h \
#	gen-c_glib/t_test_thrift_test_types.c \
#	gen-c_glib/t_test_thrift_test_types.h

#libtestcglib_la_LIBADD = $(top_builddir)/lib/c_glib/libthrift_c_glib.la

precross: TestServer

check_PROGRAMS = \
	TestServer

TestServer_SOURCES = \
	src/TestServer.m

#test_server_LDADD = \
#	libtestcglib.la \
#	$(top_builddir)/lib/c_glib/libthrift_c_glib.la

#
# Common thrift code generation rules
#
gen-cocoa/t_test_second_service.c  gen-cocoa/t_test_second_service.h  gen-cocoa/t_test_thrift_test.c  gen-cocoa/t_test_thrift_test.h  gen-cocoa/t_test_thrift_test_types.c  gen-cocoa/t_test_thrift_test_types.h: $(top_srcdir)/test/ThriftTest.thrift $(THRIFT)
	$(THRIFT) --gen cocoa -r $<

AM_CFLAGS = -g -Wall -Wextra
AM_CXXFLAGS = $(AM_CFLAGS)
AM_CPPFLAGS = -I$(top_srcdir)/lib/cocoa/src -Igen-cocoa
AM_LDFLAGS = @GCOV_LDFLAGS@

clean-local:
	$(RM) gen-cocoa/*

EXTRA_DIST = \
	src/TestServer.m
