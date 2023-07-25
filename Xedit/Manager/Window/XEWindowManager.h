//
//  XEWindowManager.h
//  Xedit
//
//  Created by Mustafa Malik on 23/07/2023.
//

#ifndef XEDIT_MANAGER_WINDOW_XEWINDOWMANAGER_H
#define XEDIT_MANAGER_WINDOW_XEWINDOWMANAGER_H

#define XE_USE_COCOA
#define XE_USE_DEBUG

#import "XETools.h"

@class XEWindowManager;

@interface XEWindowManager : NSObject

+ (NSWindow*) makeWindow:(CGRect)rectInfo mask:(NSWindowStyleMask)flags defer:(BOOL)value;

+ (NSArray<NSScreen*>*) getAvailableScreens;

+ (void) moveToScreen:(NSWindow*)window :(NSScreen*)screen;
+ (void) destroyWindow:(NSWindow*)window;

@end

#endif /* XEDIT_MANAGER_WINDOW_XEWINDOWMANAGER_H */
