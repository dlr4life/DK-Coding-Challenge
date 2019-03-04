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
    
    var list: Array = [Double]()
    var indexBegin: Double = 0
    var indexEnd: Double = 0
    var threshold: Int = 0
    var winLength: Int = 0
    var timestamp: String = ""
    var impactValue: Double = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // The index at which impact occurs in the supplied data file.
        impactIndexLabel.text = "Index for impact: \(impactValue.description)"
        
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
    
    // Extract a row of data for a particular value in the timestamp column
    func getTimestampData(timestamp: String)->(Array<[String:String]>) {
        let array = getSwiftArrayFromPlist(name: "latestSwing")
        let namePredicate = NSPredicate(format: "Timestamp = %@", timestamp)

        // Loop through an array, for rows
        array.enumerated().forEach { (index, element) in

            // Print the rows
            print("\(index): \(element)")
        }

        // Loop through the array, for columns
        for index in array {
            let swingAX = index["AX"] // Assign column 0 to swingAX
            let swingAY = index["AY"] // Assign column 0 to swingAY
            let swingAZ = index["AZ"] // Assign column 0 to swingAZ
            let swingTimestamp = index["Timestamp"] // Assign column 0 to Timestamp
            let swingWX = index["WX"] // Assign column 0 to swingWX
            let swingWY = index["WY"] // Assign column 0 to swingWY
            let swingWZ = index["WZ"] // Assign column 0 to swingWZ

            print(swingTimestamp!) // Print out column 0
            print(swingAX!) // Print out column 1
            print(swingAY!) // Print out column 2
            print(swingAZ!) // Print out column 3
            print(swingWX!) // Print out column 4
            print(swingWY!) // Print out column 5
            print(swingWZ!) // Print out column 6
        }

        print(array)
        return [array.filter {namePredicate.evaluate(with: $0)}[0]]
    }
    
    // Binary Search Helper Method
    func binarySearch(array: [Int], key: Int) -> Bool {
        if array.count == 0 { return false }
        let minIndex: Int = 0
        let maxIndex: Int = array.count - 1
        let midIndex: Int = maxIndex / 2
        if key > array[maxIndex] || key < array[minIndex] {
            return false
        }
        
        let midValue = array[midIndex]
        if key > midValue {
            let slice: [Int] = Array(array[midIndex + 1...maxIndex])
            return binarySearch(array: slice, key: key)
        }
        
        if key < midValue {
            let slice: [Int] = Array(array[minIndex...midIndex - 1])
            return binarySearch(array: slice, key: key)
        }
        
        if key == midValue {
            return true
        }
        return false
    }
    
    // From indexBegin to indexEnd , search data for values that are higher than threshold . Return the first index where data has values that meet this criteria for at least winLength samples.
    func searchContinuityAboveValue(array: [Int], indexBegin: Double, indexEnd: Double, threshold: Double, winLength: Int) -> Bool {
        
        print("For the latestSwing.csv file, ")
        return false
    }
    
    // From indexBegin to indexEnd (where indexBegin is larger than indexEnd ), search data for values that are higher than thresholdLo and lower than thresholdHi. Return the first index where data has values that meet this criteria for at least winLength samples.
    func backSearchContinuityWithinRange(array: [Int], indexBegin: Double, indexEnd: Double, thresholdLo: Double, thresholdHi: Double, winLength: Int) -> Bool {
    
        print("For the latestSwing.csv file, ")
        return false
    }
    
    // From indexBegin to indexEnd, search data1 for values that are higher than threshold1 and also search data2 for values that are higher than threshold2. Return the first index where both data1 and data2 have values that meet these criteria for at least winLength samples.
    func searchContinuityAboveValueTwoSignals(array: [Int], sum: Int) -> Bool {
        var lowIndex = 0
        var highIndex = array.count - 1
        
        while lowIndex < highIndex {
            let sumOfItems = array[lowIndex] + array[highIndex]
            if sumOfItems == sum {
                print("Sum of \(array[lowIndex]) and \(array[highIndex]) = \(sum)")
                return true
            } else if sumOfItems < sum {
                lowIndex += 1
            } else if sumOfItems > sum {
                highIndex -= 1
            }
        }
        print("For the latestSwing.csv file, pointers have crossed")
        return false
    }
    
    // From indexBegin to indexEnd, search data for values that are higher than thresholdLo and lower than thresholdHi. Return the the starting index and ending index of all continuous samples that meet this criteria for at least winLength data points.
    func searchMultiContinuityWithinRange(array: [Int], indexBegin: Double, indexEnd: Double, thresholdLo: Double, thresholdHi: Double, winLength: Int) -> Bool {
        
        print("For the latestSwing.csv file, ")
        return false
    }
}
