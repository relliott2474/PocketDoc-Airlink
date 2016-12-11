//
//  NoteFile+CoreDataProperties.h
//  PocketDoc-Airlink
//
//  Created by Rod Elliott-Mullens on 11/22/16.
//  Copyright © 2016 Rod. All rights reserved.
//

#import "NoteFile+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface NoteFile (CoreDataProperties)

+ (NSFetchRequest<NoteFile *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *noteDate;
@property (nullable, nonatomic, copy) NSString *noteText;
@property (nullable, nonatomic, copy) NSString *noteTitle;

@end

NS_ASSUME_NONNULL_END
