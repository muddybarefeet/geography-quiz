//
//  MapViewContoller.swift
//  geographyQuiz
//
//  Created by Anna Rogers on 8/13/16.
//  Copyright © 2016 Anna Rogers. All rights reserved.
//

import UIKit
import MapKit
import CoreData

class MapViewContoller: CoreDataController, MKMapViewDelegate {

    var continentSelected: String = ""
//    @IBOutlet weak var mapView: MKMapView!
    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Extrcat the data from core data
        let app = UIApplication.sharedApplication().delegate as! AppDelegate
        let land = app.landAreas
        let fetchRequest = NSFetchRequest(entityName: "CountryModel")
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
        fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: land.context, sectionNameKeyPath: nil, cacheName: nil)
        let entities = fetchedResultsController!.fetchedObjects as! [CountryModel]
        print("entities", entities.count)
        
        // TODO
        for entity in entities {
            if (entity.continent == continentSelected) {
//                let country = Country(name: entity.name!, points: entity.coordinates!, coordType: entity.coordinate_type!)
//                game["toPlay"]![entity.name!] = entity.name
//                addBoundary(country, resetZoom: true)
            }
        }

        
    }

}


// extension to hold styling
extension MapViewContoller {
    
    func showAllCountries () {
        // TODO: copy over code
    }
    
}