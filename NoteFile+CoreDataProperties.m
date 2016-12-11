//
//  NoteFile+CoreDataProperties.m
//  PocketDoc-Airlink
//
//  Created by Rod Elliott-Mullens on 11/22/16.
//  Copyright © 2016 Rod. All rights reserved.
//

#import "NoteFile+CoreDataProperties.h"

@implementation NoteFile (CoreDataProperties)

+ (NSFetchRequest<NoteFile *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"NoteFile"];
}

@dynamic noteDate;
@dynamic noteText;
@dynamic noteTitle;

@end
