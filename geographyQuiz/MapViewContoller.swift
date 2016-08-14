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
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Add button to nav bar to remove all the overlays
        let showButton: UIBarButtonItem = UIBarButtonItem(title: "Show All", style: .Plain, target: self, action: #selector(self.showAllCountries))
        self.navigationItem.rightBarButtonItem = showButton
        
    }

}


// extension to hold styling
extension MapViewContoller {
    
    func showAllCountries () {
        // TODO: copy over code
    }
    
}