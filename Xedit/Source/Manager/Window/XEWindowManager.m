//
//  XEWindowManager.m
//  Xedit
//
//  Created by Mustafa Malik on 25/07/2023.
//

#import "XEWindowManager.h"

@implementation XEWindowManager

+ (NSWindow*) makeWindow:(CGRect)rectInfo mask:(NSWindowStyleMask)flags defer:(BOOL)value {
    return [[NSWindow alloc] initWithContentRect:rectInfo styleMask:flags backing:NSBackingStoreBuffered defer:value screen:nil];
}

+ (NSArray<NSScreen*>*) getAvailableScreens {
    return [NSScreen screens];
}

+ (void) moveToScreen:(NSWindow*)window :(NSScreen*)screen {
    if ([window screen] == screen) {
        return;
    }
    [window setFrame: screen.frame display:YES];
}

+ (void) destroyWindow:(NSWindow*)window {
    [window close];
}

+ (void) hideWindowButtons:(NSWindow *)currentWindow styleButton:(NSUInteger)windowButton {
    [[currentWindow standardWindowButton:windowButton] setHidden:YES];
}

@end
