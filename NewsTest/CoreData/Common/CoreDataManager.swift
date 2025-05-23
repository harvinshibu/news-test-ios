//
//  CoreDataManager.swift
//  NewsTest
//
//  Created by Harvin Shibu on 23/05/25.
//

import Foundation
import CoreData


@MainActor
final class CoreDataManager {
    static let shared = CoreDataManager()
    
    private let name = CDConstants.NAME
    private init() {}
    
    lazy var persistentContainer: NSPersistentContainer = {
        guard let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
            fatalError("Failed to get the documents URL")
        }
        let container = NSPersistentContainer(name: name)
        let destURL = documentsURL.appendingPathComponent("\(name).sqlite")
        let description = NSPersistentStoreDescription(url: destURL)
        container.persistentStoreDescriptions = [description]
        container.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Unable to load persistent stores: \(error)")
            }
        }
        return container
    }()
    
    var context: NSManagedObjectContext {
        self.persistentContainer.viewContext
    }
    
    static func save(_ cntxt: NSManagedObjectContext) {
        do {
            try cntxt.save()
        } catch {
            print("CoreData context save failed")
        }
    }
    
    static func deleteAllData(_ entity:String, ctx: NSManagedObjectContext) {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entity)
        fetchRequest.returnsObjectsAsFaults = false
        do {
            let results = try ctx.fetch(fetchRequest)
            for object in results {
                guard let objectData = object as? NSManagedObject else {continue}
                ctx.delete(objectData)
            }
        } catch let error {
            print("Delete all data in \(entity) error :", error)
        }
    }
    
    static func getAllData(_ entity: String, ctx: NSManagedObjectContext) -> [Any]?{
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entity)
        fetchRequest.returnsObjectsAsFaults = false
        do {
            let results = try ctx.fetch(fetchRequest)
            return results
        } catch let error {
            print("Get all data in \(entity) error :", error)
        }
        return nil
    }
}
