//
//  XEConstraintManager.h
//  Xedit
//
//  Created by Mustafa Malik on 26/07/2023.
//

#ifndef XEDIT_MANAGER_LAYOUT_XECONSTRAINTMANAGER_H
#define XEDIT_MANAGER_LAYOUT_XECONSTRAINTMANAGER_H

#define XE_USE_COCOA
#import "XETools.h"

@interface XEConstraintManager : NSObject

+ (NSLayoutConstraint*) fixLayout:(id)firstView attribute:(NSLayoutAttribute)attrib relation:(NSLayoutRelation)relate attribute:(NSLayoutAttribute)attrib2 factor:(CGFloat)mul fixedRange:(CGFloat)constant;

@end

#endif /* XEDIT_MANAGER_LAYOUT_XECONSTRAINTMANAGER_H */
