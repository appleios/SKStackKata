//
// Created by Aziz Latipov on 24.07.17.
// Copyright (c) 2017 Aziz L. All rights reserved.
//

#import "SKStack.h"


NSString *const SKStackOverflowExceptionName = @"Overflow";
NSString *const SKStackUnderflowExceptionName = @"Underflow";


@interface SKEmptyStack : NSObject <SKStack>
@end
@implementation SKEmptyStack
- (BOOL)isEmpty
{
    return YES;
}
- (NSUInteger)size
{
    return 0;
}
- (void)push:(id)object
{
    @throw([[NSException alloc] initWithName:SKStackOverflowExceptionName reason:@"Pushing onto full stack is not allowed" userInfo:nil]);
}

- (id)pop
{
    @throw([[NSException alloc] initWithName:SKStackUnderflowExceptionName reason:@"Popping empty stack is not allowed" userInfo:nil]);
    return nil;
}
@end


@interface SKStack ()

@property (nonatomic, strong) NSMutableArray *elements;
@property (nonatomic, assign) NSUInteger size;
@property (nonatomic, assign) NSUInteger capacity;

@end


@implementation SKStack

+ (id<SKStack>)stackWithCapacity:(NSUInteger)capacity
{
    if (capacity == 0) {
        return [[SKEmptyStack alloc] init];
    }
    return [[SKStack alloc] initWithCapacity:capacity];
}

- (instancetype)initWithCapacity:(NSUInteger)capacity
{
    self = [super init];
    if (self) {
        _capacity = capacity;
        _elements = [[NSMutableArray alloc] init];
    }
    return self;
}

- (BOOL)isEmpty
{
    return self.size == 0;
}

- (void)push:(id)object
{
    if (self.size == self.capacity) {
        @throw([[NSException alloc] initWithName:SKStackOverflowExceptionName reason:@"Pushing onto full stack is not allowed" userInfo:nil]);
    }
    self.elements[self.size++] = object;
}

- (id)pop
{
    if (self.size == 0) {
        @throw([[NSException alloc] initWithName:SKStackUnderflowExceptionName reason:@"Popping empty stack is not allowed" userInfo:nil]);
    }
    return self.elements[--self.size];
}

@end
