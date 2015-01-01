#import "NSDictionary+XPCParse.h"

#define FIXER_NAME @"aab6d061ceb2b05340ac6573e9c65f651b21272e"

%hook XBApplicationLaunchCompatibilityInfo

- (id)initWithXPCDictionary:(xpc_object_t)xpcDictionary {
	NSDictionary *dict = [NSDictionary dictionaryWithContentsOfXPCObject:xpcDictionary];
	if (!dict[@"launchNibName"]) {
		return %orig();
	}
	
	// Check if nib actually exists
	UINib *nib = [UINib nibWithNibName:dict[@"launchNibName"] bundle:[NSBundle bundleWithPath:dict[@"bundlePath"]]];
	if (nib != nil) {
		return %orig();
	}
	
	NSMutableDictionary *mutableDict = [dict mutableCopy];
	[mutableDict setObject:FIXER_NAME forKey:@"launchNibName"];
	
	xpc_object_t xpcObj = [mutableDict newXPCObject];
	
	return %orig(xpcObj);
}
%end

%hook UINib
+ (UINib *)nibWithNibName:(NSString *)name bundle:(NSBundle *)bundleOrNi {
	if ([name isEqualToString:FIXER_NAME]) {
		return nil;
	}
	
	return %orig();
}
%end