//
//  ViewController.swift
//  DK Challenge
//
//  Created by DLR on 2/18/19.
//  Copyright © 2019 DLR. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // DK sensors record data from a three-axis accelerometer and a three-axis gyroscope.
    // In order to appropriately use that data, we also need to record the timestamp at which the samples were taken.
    // For any one swing, we'll have about a thousand such samples. We'd like you to put together a data structure that would represent all of this data.
    // The columns are (in order) timestamp, ax, ay, az, wx, wy, wz.
    // This is an actual data file from a real swing from our sensor.
    // Operations on this data typically occur in a sequential fashion.
    // That fashion being one that starts from either the first element or important indices in the swing data that we identify during processing (swing start, impact, swing end, etc.).
    // All of the operations described below will occur on only one of the columns.
    // In the case of searchContinuityAboveValueTwoSignals, the operations described below will occur on two of the columns.
    
    @IBOutlet weak var searchContinuityAboveValueLbl: UILabel!
    @IBOutlet weak var backSearchContinuityWithinRangeLbl: UILabel!
    @IBOutlet weak var searchContinuityAboveValueTwoSignalsLbl: UILabel!
    @IBOutlet weak var searchMultiContinuityWithinRangeLbl: UILabel!
    @IBOutlet weak var impactIndexLabel: UILabel!
    
    var indexBegin: Double = 0
    var indexEnd: Double = 0
    var threshold: Double = 0
    var impactValue: Double = 0
    var winLength: Int = 0
    var timestamp: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // The index at which impact occurs in the supplied data file.
        impactIndexLabel.text = "Index for impact: \(impactValue.description)"
        
        searchContinuityAboveValue()
        backSearchContinuityWithinRange()
        searchContinuityAboveValueTwoSignals()
        searchMultiContinuityWithinRange()
        
//        getTimestampData(timestamp: "571895")
//        getTimestampData()
    }
    
    // #TESTA - Extract a swift array from the plist
    func getSwiftArrayFromPlist(name: String)->(Array<Dictionary<String, String>>) {
        let path = Bundle.main.path(forResource: name, ofType: "plist")
        var arr: NSArray?
        arr = NSArray(contentsOfFile: path!)
        return (arr as? Array<Dictionary<String, String>>)!
    }
    
    // #TESTA - Extract a row of data for a particular value in the timestamp column
//    func getTimestampData(timestamp: String)->(Array<[String:String]>) {
//        let array = getSwiftArrayFromPlist(name: "latestSwing")
//        let namePredicate = NSPredicate(format: "Timestamp = %@", timestamp)
//
//        // Loop through an array, for rows
//        array.enumerated().forEach { (index, element) in
//
//            // Print the rows
//            print("\(index): \(element)")
//        }
//
//        // Loop through the array, for columns
//        for index in array {
//            let swingAX = index["AX"] // Assign column 0 to swingAX
//            let swingAY = index["AY"] // Assign column 0 to swingAY
//            let swingAZ = index["AZ"] // Assign column 0 to swingAZ
//            let swingTimestamp = index["Timestamp"] // Assign column 0 to Timestamp
//            let swingWX = index["WX"] // Assign column 0 to swingWX
//            let swingWY = index["WY"] // Assign column 0 to swingWY
//            let swingWZ = index["WZ"] // Assign column 0 to swingWZ
//
//            print(swingTimestamp!) // Print out column 0
//            print(swingAX!) // Print out column 1
//            print(swingAY!) // Print out column 2
//            print(swingAZ!) // Print out column 3
//            print(swingWX!) // Print out column 4
//            print(swingWY!) // Print out column 5
//            print(swingWZ!) // Print out column 6
//        }
//
//        print(array)
//        return [array.filter {namePredicate.evaluate(with: $0)}[0]]
//    }
    
    // From indexBegin to indexEnd, search data for values that are higher than threshold. Return the first index where data has values that meet this criteria for at least winLength samples.
    func searchContinuityAboveValue() {
        // MARK: - Plan 1
//        let array = getSwiftArrayFromPlist(name: "latestSwing")
//
//        // Filter the rows by Timestamp predicate
//
//        // Loop through an array, for rows
//        array.enumerated().forEach { (index, element) in
//
//            // Compare rows by values (column 1)
//
//            // Compare rows by values (column 2)
//
//            // Compare rows by values (column 3)
//
//            // Compare rows by values (column 4)
//
//            // Compare rows by values (column 5)
//
//            // Compare rows by values (column 6)
//
////            print(array)
//            // Print the rows
////            print("\(index): \(element)")
//        }
        
        // MARK: - Plan 2
        let rows = Array(0...1276)
        let hashMappedRows = rows.hashMap()
        
        let threshold = 1
        
        // returns the index of the item and if all the elements in the array are different, it will work to get the index of the object
        let indexOfnumToDetect = hashMappedRows[threshold]
        
        print(indexOfnumToDetect!) // prints 1
        
        // Let's just focus in check if the element is in the array.
        let criteriaExists = indexOfnumToDetect != "\(1.208984.description)" // if the key does not exist (means the number is not contained in the collection.)
        print(criteriaExists) // prints true
        
        searchContinuityAboveValueLbl.text! = "For the latestSwing.csv file, the searchContinuityAboveValue is: \(threshold.description)"
//        print("For the latestSwing.csv file, the searchContinuityAboveValue is: \(threshold.description)")
    }
    
    // From indexBegin to indexEnd (where indexBegin is larger than indexEnd), search data for values that are higher than thresholdLo and lower than thresholdHi. Return the first index where data has values that meet this criteria for at least winLength samples.
    func backSearchContinuityWithinRange() {
        
        backSearchContinuityWithinRangeLbl.text! = "For the latestSwing.csv file, the backSearchContinuityWithinRange is: \(threshold.description)"
//        print("For the latestSwing.csv file, the backSearchContinuityWithinRange is: \(threshold.description)")
    }
    
    // From indexBegin to indexEnd, search data1 for values that are higher than threshold1 and also search data2 for values that are higher than threshold2. Return the first index where both data1 and data2 have values that meet these criteria for at least winLength samples.
    func searchContinuityAboveValueTwoSignals() {
       
        searchContinuityAboveValueTwoSignalsLbl.text! = "For the latestSwing.csv file, the searchContinuityAboveValueTwoSignals is: \(threshold.description)"
//        print("For the latestSwing.csv file, the searchContinuityAboveValueTwoSignals is: \(threshold.description)")
    }
    
    // From indexBegin to indexEnd, search data for values that are higher than thresholdLo and lower than thresholdHi. Return the the starting index and ending index of all continuous samples that meet this criteria for at least winLength data points.
    func searchMultiContinuityWithinRange() {
        
        searchMultiContinuityWithinRangeLbl.text! = "For the latestSwing.csv file, the searchMultiContinuityWithinRange is: \(threshold.description)"
//        print("For the latestSwing.csv file, the searchMultiContinuityWithinRange is: \(threshold.description)")
    }
}

// Creating a "hash map" generic function, extending the Sequence protocol.
extension Sequence where Element: Hashable {
    
    func hashMap() -> [Element: String] {
        var dict: [Element: String] = [:]
        for (i, value) in self.enumerated() {
            dict[value] = i.description
        }
        return dict
    }
}
