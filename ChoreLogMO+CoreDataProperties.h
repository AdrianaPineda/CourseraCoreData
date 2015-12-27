//
//  ChoreLogMO+CoreDataProperties.h
//  CoreDataCoursera
//
//  Created by Adriana Pineda on 12/25/15.
//  Copyright © 2015 Adriana Pineda. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "ChoreLogMO.h"

NS_ASSUME_NONNULL_BEGIN

@interface ChoreLogMO (CoreDataProperties)

@property (nullable, nonatomic, retain) NSDate *when;
@property (nullable, nonatomic, retain) ChoreMO *chore;
@property (nullable, nonatomic, retain) PersonMO *person;

@end

NS_ASSUME_NONNULL_END
