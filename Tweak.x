@interface SBSApplicationShortcutItem : NSObject
@property (nonatomic, retain) NSString *type;
@end

static BOOL enabled, hideDelete, hideShare, hideRearrange;

static void loadPrefs() {
	NSMutableDictionary *settings;

	CFArrayRef keyList = CFPreferencesCopyKeyList(CFSTR("com.shepgoba.remove3doptionsprefs"), kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
	if (keyList) {
		settings = (NSMutableDictionary *)CFBridgingRelease(CFPreferencesCopyMultiple(keyList, CFSTR("com.shepgoba.remove3doptionsprefs"), kCFPreferencesCurrentUser, kCFPreferencesAnyHost));
		CFRelease(keyList);
	} else {
		settings = nil;
	}

	if (!settings) {
		settings = [NSMutableDictionary dictionaryWithContentsOfFile:@"/var/mobile/Library/Preferences/com.shepgoba.remove3doptionsprefs.plist"];
	}

  	enabled = [([settings objectForKey:@"enabled"] ? [settings objectForKey:@"enabled"] : @(YES)) boolValue];
	hideDelete = [([settings objectForKey:@"hideDelete"] ? [settings objectForKey:@"hideDelete"] : @(YES)) boolValue];
	hideShare = [([settings objectForKey:@"hideShare"] ? [settings objectForKey:@"hideShare"] : @(NO)) boolValue];
	hideRearrange = [([settings objectForKey:@"hideRearrange"] ? [settings objectForKey:@"hideRearrange"] : @(NO)) boolValue];
}

%hook SBIconView
-(void)setApplicationShortcutItems:(NSArray *)arg1 {
	NSMutableArray *newItems = [[NSMutableArray alloc] init];
	for (SBSApplicationShortcutItem *item in arg1) {
		if ([item.type isEqual: @"com.apple.springboardhome.application-shotcut-item.delete-app"]) {
			if (!hideDelete) {
				[newItems addObject: item];
			}
			continue;
		}
		if ([item.type isEqual: @"com.apple.springboardhome.application-shortcut-item.share"]) {
			if (!hideShare) {
				[newItems addObject: item];
			}
			continue;
		}
		if ([item.type isEqual: @"com.apple.springboardhome.application-shotcut-item.rearrange-icons"]) {
			if (!hideRearrange) {
				[newItems addObject: item];
			}
			continue;
		}
		[newItems addObject:item];
	}
	%orig(newItems);
}
%end

%ctor {
	loadPrefs();
	if (enabled)
		%init(_ungrouped);
}