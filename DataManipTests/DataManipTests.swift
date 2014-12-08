//
//  DataManipTests.swift
//  DataManipTests
//
//  Created by Batutin, Andriy on 12/1/14.
//  Copyright (c) 2014 Batutin, Andriy. All rights reserved.
//

import UIKit
import XCTest

class DataManipTests: XCTestCase {
    
    var jsonStructure:[TopLevelCollection] = []
    
    override func setUp() {
        super.setUp()
        jsonStructure = generateDataSet("id", numberOfItems: 10)
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func generateDataSet(articleIDBase:String, numberOfItems:Int) ->[TopLevelCollection]{
        
        var accModel:Array<TopLevelCollection> = []
        for n in 0..<1{
            var accSection:Array<OneStepDownCollection> = []
            for m in 0..<numberOfItems{
                var accItem:Array<TwoStepDownCollection> = []
                for j in 0..<numberOfItems{
                    var accDot:Array<ThreeStepDownCollection> = []
                    for i in 0 ..< numberOfItems{
                        let number = String (n) + String(m) + String(j) + String(i)
                        let dot = ThreeStepDownCollection(articleID: articleIDBase + number)
                        accDot.append(dot)
                    }
                    let item = TwoStepDownCollection(dots: accDot)
                    accItem.append(item)
                }
                let section = OneStepDownCollection(items: accItem)
                accSection.append(section)
            }
            let model = TopLevelCollection(sections: accSection)
            accModel.append(model)
        }
        return accModel
    }
    
    func testExample() {
        let coll = generateDataSet("id", numberOfItems: 3)
        let test1 = coll.reduce([]){$0 + $1.sections}.reduce([]) { $0 + $1.items }.reduce([]){$0 + $1.dots}.map({$0.articleID})
        println(test1)
        XCTAssertEqual(test1.count, 81, "should have 81 elem")
        
    }
    
    func testBenchExample() {
        let test1 = jsonStructure.reduce([]){$0 + $1.sections}.reduce([]) { $0 + $1.items }.reduce([]){$0 + $1.dots}.map({$0.articleID})
    }
    
    func testPerformanceExample() {
        self.measureBlock() {
            self.testBenchExample()
        }
    }
    
}
