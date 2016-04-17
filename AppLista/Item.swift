//
//  Item.swift
//  AppLista
//
//  Created by ORT1 on 4/16/16.
//  Copyright © 2016 ORT. All rights reserved.
//

import Foundation
import CoreData

class Item: NSManagedObject {
    @NSManaged var nome: String
    @NSManaged var creationDate: NSDate
    @NSManaged var lat: Double
    @NSManaged var lng: Double
    @NSManaged var locationName: String
}