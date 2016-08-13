//
//  CoreDataViewController.swift
//  geographyQuiz
//
//  Created by Anna Rogers on 8/13/16.
//  Copyright © 2016 Anna Rogers. All rights reserved.
//

import UIKit
import CoreData

class CoreDataController: UIViewController {
    
    var fetchedResultsController : NSFetchedResultsController?{
        didSet{
            executeSearch()
        }
    }
    
    // Initializer. It has to be implemented because of the way Swift interfaces with an Objective C
    // Protocol called NSArchiving.
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func executeSearch(){
        if let fc = fetchedResultsController{
            do{
                try fc.performFetch()
            }catch let e as NSError{
                print("Error while trying to perform a search: \n\(e)\n\(fetchedResultsController)")
            }
        }
    }
    
}

