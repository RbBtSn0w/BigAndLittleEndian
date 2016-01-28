//
//  QLVernierDataNetwork2Host.m
//  BigAndLittleEndian
//
//  Created by Snow Wu on 1/28/16.
//  Copyright © 2016 Snow Wu. All rights reserved.
//

#import "QLVernierDataNetwork2Host.h"

NS_ASSUME_NONNULL_BEGIN
@interface QLVernierDataNetwork2Host ()

@property(atomic, strong, readwrite) NSData *bufferData;
@property(atomic, assign, readwrite) NSUInteger position;

@end
@implementation QLVernierDataNetwork2Host

+(QLVernierDataNetwork2Host*) dataWithNSData:(NSData*) data
{
    QLVernierDataNetwork2Host *vdn2h = [[QLVernierDataNetwork2Host alloc] initWithNSData:data];
    return vdn2h;
}

- (id)initWithNSData:(NSData *)data {
    self = [super init];
    if (self) {
        self.bufferData = data;
        self.position = 0;
    }
    return self;
}

- (void)dealloc {
    _bufferData = nil;
    self.position = 0;
}

- (const void *)bytes {
    return [self.bufferData bytes];
}

- (NSUInteger)length {
    return [self.bufferData length];
}

- (void)getBytes:(void *)bytes range:(NSRange)range {
    [self.bufferData getBytes:bytes range:range];
}

- (int64_t)getInt64 {
    int64_t i = 0;
    NSRange range;
    range.length = 8;
    range.location = self.position;
    [self getBytes:(void *)&i range:range];
    self.position += range.length;
    return ntohll(i);
}

- (int32_t)getInt32 {
    int32_t i = 0;
    NSRange range;
    range.length = 4;
    range.location = self.position;
    [self getBytes:(void *)&i range:range];
    self.position += range.length;
    return ntohl(i);
}

- (int16_t)getInt16 {
    int16_t i = 0;
    NSRange range;
    range.length = 2;
    range.location = self.position;
    [self getBytes:(void *)&i range:range];
    self.position += range.length;
    return ntohs(i);
}

- (int8_t)getInt8 {
    int8_t i = 0;
    NSRange range;
    range.length = 1;
    range.location = self.position;
    [self getBytes:(void *)&i range:range];
    self.position += range.length;
    return i;
}

- (int8_t)getInt8ByPostion:(int)position {
    int8_t i = 0;
    NSRange range;
    range.length = 1;
    range.location = position;
    [self getBytes:(void *)&i range:range];
    return i;
}

- (NSString *)getString:(NSUInteger)size {
    NSRange range;
    range.length = size;
    range.location = self.position;
    char *buf = malloc(size + 1);
    [self getBytes:buf range:range];
    self.position += size;
    buf[size] = 0;
    NSString *str = [NSString stringWithUTF8String:buf];
    free(buf);
    return str;
}

- (NSData *)getBytes:(NSUInteger)size {
    NSRange range;
    range.length = size;
    range.location = self.position;
    char *buf = malloc(size);
    [self getBytes:buf range:range];
    self.position += size;
    NSData *data = [NSData dataWithBytes:buf length:size];
    free(buf);
    return data;
}

- (NSData *)getBytes:(NSRange)range length:(NSUInteger)length {
    char *buf = malloc(length);
    [self getBytes:buf range:range];
    NSData *data = [NSData dataWithBytes:buf length:length];
    free(buf);
    return data;
}

- (void)skip:(int)p {
    self.position += p;
}

- (void)reset {
    self.position = 0;
}

@end
NS_ASSUME_NONNULL_END