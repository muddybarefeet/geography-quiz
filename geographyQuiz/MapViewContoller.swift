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
import Mapbox

class MapViewContoller: CoreDataController, MKMapViewDelegate, MGLMapViewDelegate {

    var continentSelected: String = ""
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // override mapkit map with custom mapbox map
        let styleURL = NSURL(string: "mapbox://styles/muddybarefeet/cirqndapf001sg6km4t2uw2ph")
        let mapView = MGLMapView(frame: view.bounds, styleURL: styleURL)
        mapView.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
        // Set the map’s center coordinate and zoom level.
        mapView.setCenterCoordinate(CLLocationCoordinate2D(latitude: 59.31, longitude: 18.06), zoomLevel: 1, animated: false)
        view.addSubview(mapView)
        
        // Add button to nav bar to remove all the overlays
        let showButton: UIBarButtonItem = UIBarButtonItem(title: "Show All", style: .Plain, target: self, action: #selector(self.showAllCountries))
        self.navigationItem.rightBarButtonItem = showButton
        
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