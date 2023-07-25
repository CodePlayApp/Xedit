//
//  XeditApp.m
//  Xedit
//
//  Created by Mustafa Malik on 21/07/2023.
//

#import "XEWindowManager.h"
#import "XESplashScreen.h"

@interface Lol : NSObject

@property (nonatomic, readonly) int test;

- (int) test;

@end

@implementation Lol

- (int) test {
    return 30;
}

@end

int main(int argc, const char * argv[]) {
    XE_DEBUG(@"%@\n", @"hello world!");
    
    @autoreleasepool {
        Lol* lol = [[Lol alloc] init];
        XE_DEBUG(@"%i\n", lol.test);
    }
    
    NSApplication* xeditApp = [NSApplication sharedApplication];
    XESplashScreen* splash = [[XESplashScreen alloc] init];
    xeditApp.delegate = splash;
    return NSApplicationMain(argc, argv);
}
