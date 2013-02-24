//
//  EDGInfoPanel.m
//  ERG2007
//
//  Created by bach on 25.01.07.
//  Copyright 2007 Prof. Michael Bach. All rights reserved.
//

#import "EDGInfoPanel.h"


@implementation EDGInfoPanel


- (id) init { // NSLog(@"%s", __PRETTY_FUNCTION__);
	_panelIsOpen = NO;
	return [self initWithMsg1: @"1" andMsg2: @"2"];
}


- (id) initWithMsg1: (NSString* ) msg1 andMsg2: (NSString* ) msg2 {
	if ((self = [super init])) {	//	NSLog(@"%s", __PRETTY_FUNCTION__);
		_alert = NSGetInformationalAlertPanel(msg1, msg2 ? msg2 : @"", NULL, NULL, NULL);
		//[_alert setBackgroundColor: [NSColor colorWithDeviceWhite: 0.5 alpha: 1]];
		_alert.alphaValue = 0.5f;
		_session = [[NSApplication sharedApplication] beginModalSessionForWindow: _alert];
		//[[NSApplication sharedApplication] runModalSession: _session];
		_panelIsOpen = YES;
	}
	return self;
}


- (void) close {	//	NSLog(@"%s", __PRETTY_FUNCTION__);
	if (!_panelIsOpen) return;
	[_alert orderOut: self];
	[[NSApplication sharedApplication] endModalSession: _session];
	NSReleaseAlertPanel(_alert);
	//	CFRunLoopRunInMode(kCFRunLoopDefaultMode, 0.01, false);	// do we really need this to get rid of the window? Commented out 2010-05-11
	_panelIsOpen = NO;
	[super release];
}


- (void) dealloc {	//	NSLog(@"%s", __PRETTY_FUNCTION__);
	if (_panelIsOpen) {
		_panelIsOpen = NO;
		[_alert orderOut: self];
		[[NSApplication sharedApplication] endModalSession: _session];
		NSReleaseAlertPanel(_alert);
	}
	//	CFRunLoopRunInMode(kCFRunLoopDefaultMode, 0.01, false);	// do we really need this to get rid of the window? Commented out 2010-05-11
	[super dealloc];
}


@end
