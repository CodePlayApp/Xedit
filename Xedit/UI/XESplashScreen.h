//
//  XESplashScreen.h
//  Xedit
//
//  Created by Mustafa Malik on 23/07/2023.
//

#ifndef XEDIT_UI_XESPLASHSCREEN_H
#define XEDIT_UI_XESPLASHSCREEN_H

#define XE_USE_COCOA
#define XE_USE_CONFIG

#import "XETools.h"

@interface XESplashScreen : NSObject<NSApplicationDelegate> {
@private
    NSWindow* window;
    NSStackView* mainStack;
    NSStackView* leftStack;
    NSStackView* rightStack;
}
/*
 Main Window
 Left Side
 Right Side
 Logo and titles
 recent projects
*/

@property(nonatomic, readonly) int width;
@property(nonatomic, readonly) int height;

// Synced with macOS system colour
- (void) createWelcomeWindow;
- (void) createMainStack;
- (void) createLeftView;
- (void) createRightView;
- (void) createRecentStack;

- (BOOL) canReadCachedProjects;
- (void) displayRecentProjects;

@end

#endif /* XEDIT_UI_XESPLASHSCREEN_H */
