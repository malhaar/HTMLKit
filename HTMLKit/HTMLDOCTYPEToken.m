//
//  HTMLDOCTYPEToken.m
//  HTMLKit
//
//  Created by Iska on 23/10/14.
//  Copyright (c) 2014 BrainCookie. All rights reserved.
//

#import "HTMLDOCTYPEToken.h"

@interface HTMLDOCTYPEToken ()
{
	NSMutableString *_name;
}

@end

@implementation HTMLDOCTYPEToken
@synthesize name = _name;

- (instancetype)initWithName:(NSString *)name
{
	self = [super init];
	if (self) {
		self.type = HTMLTokenTypeDoctype;
		_name = [[NSMutableString alloc] initWithString:name];
	}
	return self;
}

- (void)appendStringToName:(NSString *)string
{
	[_name appendString:string];
}

#pragma mark - NSObject

- (BOOL)isEqual:(id)other
{
	if ([other isKindOfClass:[self class]]) {
		HTMLDOCTYPEToken *token = (HTMLDOCTYPEToken *)other;
		return (
				[self.name isEqualToString:token.name] &&
				[self.publicIdentifier isEqualToString:token.publicIdentifier] &&
				[self.systemIdentifier isEqualToString:token.systemIdentifier]
				);
	}
	return NO;
}

- (NSUInteger)hash
{
	return self.name.hash + self.publicIdentifier.hash + self.systemIdentifier.hash;
}

- (NSString *)description
{
	return [NSString stringWithFormat:@"<%@: %p Name='%@' Public='%@' System='%@'>", self.class, self, _name, _publicIdentifier, _systemIdentifier];
}

@end
