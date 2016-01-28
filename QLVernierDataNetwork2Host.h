//
//  QLVernierDataNetwork2Host.h
//  BigAndLittleEndian
//
//  Created by Snow Wu on 1/28/16.
//  Copyright © 2016 Snow Wu. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@interface QLVernierDataNetwork2Host : NSObject

+(QLVernierDataNetwork2Host*) dataWithNSData:(NSData*) data;
- (id)initWithNSData:(NSData*) data;

@property(atomic, strong, readonly) NSData *bufferData;
@property(atomic, assign, readonly) NSUInteger position;

- (int8_t)getInt8ByPostion:(int)position;
- (int8_t)getInt8;
- (int16_t)getInt16;
- (int32_t)getInt32;
- (int64_t)getInt64;
- (NSData *)getBytes:(NSUInteger)size;
- (NSData *)getBytes:(NSRange)range length:(NSUInteger)length;
- (NSString *)getString:(NSUInteger)size;
- (void)skip:(int)pos;
- (void)reset;
- (const void *)bytes;
- (NSUInteger)length;

@end
NS_ASSUME_NONNULL_END