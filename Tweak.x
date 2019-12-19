@interface SBSApplicationShortcutItem : NSObject
@property (nonatomic, retain) NSString *type;
@end

%hook SBIconView
-(void)setApplicationShortcutItems:(NSArray *)arg1 {
	NSMutableArray *newItems = [[NSMutableArray alloc] init];
	for (SBSApplicationShortcutItem *item in arg1) {
		if (![item.type isEqual: @"com.apple.springboardhome.application-shotcut-item.delete-app"])
			[newItems addObject: item];
	}
	%orig(newItems);
}
%end