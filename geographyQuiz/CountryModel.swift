//
//  CountryModel.swift
//  
//
//  Created by Anna Rogers on 8/13/16.
//
//

import CoreData


class CountryModel: NSManagedObject {
    
    convenience init(name: String, continent: String, coordinates: String, coordType: String,  context : NSManagedObjectContext){
        if let ent = NSEntityDescription.entityForName("CountryModel",inManagedObjectContext: context){
            self.init(entity: ent, insertIntoManagedObjectContext: context)
            self.name = name
            self.continent = continent
            self.coordinates = coordinates
            self.coordinate_type = coordType
        }else{
            fatalError("Unable to find Entity name!")
        }
    }
    
}
