//
//  NSBundle+SoCM.m
//  Task-02
//
//  Created by Nicholas Outram on 26/05/2014.
//  Copyright (c) 2014 Plymouth University. All rights reserved.
//

#import "NSBundle+SoCM.h"

@implementation NSBundle (SoCM)
+(NSString*) pathToDocumentsFolder
{
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *documentsDirectory = [paths objectAtIndex:0];
	return documentsDirectory;
}
+(NSString*) pathToFileInDocumentsFolder:(NSString*)filename
{
	NSString *pathToDoc = [NSBundle pathToDocumentsFolder];
	return [pathToDoc stringByAppendingPathComponent:filename];
}
@end
