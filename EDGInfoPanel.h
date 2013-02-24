/*
  EDGInfoPanel.h
  ERG2007

  Created by bach on 25.01.07.
  Copyright 2007 Prof. Michael Bach. All rights reserved.

History
=======
 
2009-06-09	changed the _alert type from NSWindow to NSPanel. "runModalSession" is not necessary.
 
*/

#import <Cocoa/Cocoa.h>


@interface EDGInfoPanel: NSObject {
	NSPanel *_alert;
	NSModalSession _session;
	BOOL _panelIsOpen;
}

- (id) initWithMsg1: (NSString* ) msg1 andMsg2: (NSString* ) msg2;
- (void) close;

@end
