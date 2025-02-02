//
//  CoreDataStacks.swift
//  CalorieTracker
//
//  Created by Bradley Yin on 9/20/19.
//  Copyright © 2019 bradleyyin. All rights reserved.
//

import Foundation
import CoreData
class CoreDataStack {
    static let shared = CoreDataStack()
    lazy var container: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "CalorieTrackerModel")
        container.loadPersistentStores(completionHandler: { _, error in
            if let error = error {
                fatalError("Failed to load persistent store(s): \(error)")
            }
        })
        return container
    }()
    
    var mainContext: NSManagedObjectContext {
        return container.viewContext
    }
    
    func save(context: NSManagedObjectContext = CoreDataStack.shared.mainContext) throws {
        try context.save()
    }
}
