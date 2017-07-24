//
// Created by Aziz Latipov on 24.07.17.
// Copyright (c) 2017 Aziz L. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol SKStack <NSObject>

@property (nonatomic, assign, getter=isEmpty, readonly) BOOL empty;
@property (nonatomic, assign, readonly) NSUInteger size;

- (void)push:(id)object;

- (id)pop;

@end


@interface SKStack : NSObject <SKStack>

+ (id<SKStack>)stackWithCapacity:(NSUInteger)capacity;

- (instancetype)init NS_UNAVAILABLE;

@end


extern NSString *const SKStackOverflowExceptionName;
extern NSString *const SKStackUnderflowExceptionName;