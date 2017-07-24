//
//  StackKataTests.m
//  StackKataTests
//
//  Created by Aziz Latipov on 24.07.17.
//  Copyright © 2017 Aziz L. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "SKStack.h"


@interface StackKataTests : XCTestCase

@property (nonatomic, strong) id<SKStack> sut;

@end


@implementation StackKataTests

- (void)setUp 
{
    [super setUp];
    self.sut = [SKStack stackWithCapacity:2];
}

- (void)tearDown
{
    [super tearDown];
}

- (void)testNewlyCreateStack_ShouldBeEmptyAndSizeShouldBeZero
{
    XCTAssertTrue(self.sut.empty);
    XCTAssertEqual(self.sut.size, 0);
}

- (void)testWhenPushedOne_ItShouldNotBeEmptyAndSizeShouldBeOne
{
    [self.sut push:@1];
    XCTAssertFalse(self.sut.empty);
    XCTAssertEqual(self.sut.size, 1);
}

- (void)testAfterPushOneAndPop_ItShouldBeEmptyAndHaveZeroSize
{
    [self.sut push:@1];
    [self.sut pop];
    XCTAssertTrue(self.sut.empty);
    XCTAssertEqual(self.sut.size, 0);
}

- (void)testAfterPushOneAndTwo_ThenPopShouldReturnTwoAndOne
{
    [self.sut push:@1];
    [self.sut push:@2];
    XCTAssertEqual([self.sut pop], @2);
    XCTAssertEqual([self.sut pop], @1);
}

- (void)testAttemptToPopEmptyStack_ShouldThrowUnderflowException
{
    XCTAssertThrowsSpecificNamed([self.sut pop], NSException, SKStackUnderflowExceptionName);
}

- (void)testAttemptToPushOnFullStack_ShouldThrowOverflowException
{
    id<SKStack> sut = [SKStack stackWithCapacity:1];
    [sut push:@1];
    XCTAssertThrowsSpecificNamed([sut push:@1], NSException, SKStackOverflowExceptionName);
}

- (void)testEmptyStack_ShouldThrowOnPushAndPop
{
    id<SKStack> sut = [SKStack stackWithCapacity:0];
    XCTAssertTrue(sut.empty);
    XCTAssertEqual(sut.size, 0);
    XCTAssertThrowsSpecificNamed([sut push:@1], NSException, SKStackOverflowExceptionName);
    XCTAssertThrowsSpecificNamed([sut pop], NSException, SKStackUnderflowExceptionName);
}

@end
