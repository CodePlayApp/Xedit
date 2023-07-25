//
//  XETools.h
//  Xedit
//
//  Created by Mustafa Malik on 23/07/2023.
//

#ifndef XEDIT_XETOOLS_H
#define XEDIT_XETOOLS_H

#ifdef XE_USE_COCOA
#   import <Cocoa/Cocoa.h>
#endif

#ifdef XE_USE_DEBUG
#   import <Foundation/Foundation.h>
#   define XE_DEBUG(identifier, content) NSLog(identifier, content)
#endif

#if __cplusplus
#   ifdef XE_CLANG_ARRAY
#       include <vector>
#       include <tuple>
#   endif
#   ifdef XE_CLANG_MEMORY
#       include <memory>
#   endif
#   ifdef XE_CLANG_DEBUG
#       include <iostream>
#       define XE_CLANG_DEBUG(content) std::cout << content << '\n'
#   endif
#endif

#ifdef XE_HARDCORE
#   include <stdlib.h>
#   include <stdio.h>
#endif

//-- WINDOW CONFIGURATIONS
#ifdef XE_USE_CONFIG
#   define XE_SPLASH_SCREEN_WIDTH 795
#   define XE_SPLASH_SCREEN_HEIGHT 460
#   define XE_SPLASH_TITLE_NAME "Xedit"
#   define XE_BUILD_VERSION [[[NSBundle mainBundle] infoDictionary] objectForKey: @"CFBundleShortVersionString"]
#endif

#endif /* XEDIT_XETOOLS_H */
