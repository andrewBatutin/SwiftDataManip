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
    
    var collecionOdTestData:[MobileCarouselViewerModel] = []
    
    override func setUp() {
        super.setUp()
        collecionOdTestData = generateDataSet("id", numberOfItems: 10)
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func generateDataSet(articleIDBase:String, numberOfItems:Int) ->[MobileCarouselViewerModel]{
        
        var accModel:Array<MobileCarouselViewerModel> = []
        for n in 0..<1{
            var accSection:Array<MobileCarouselViewerSectionModel> = []
            for m in 0..<numberOfItems{
                var accItem:Array<MobileCarouselViewerItemModel> = []
                for j in 0..<numberOfItems{
                    var accDot:Array<ImageControlsModel> = []
                    for i in 0 ..< numberOfItems{
                        let number = String (n) + String(m) + String(j) + String(i)
                        let dot = ImageControlsModel(articleID: articleIDBase + number)
                        accDot.append(dot)
                    }
                    let item = MobileCarouselViewerItemModel(dots: accDot)
                    accItem.append(item)
                }
                let section = MobileCarouselViewerSectionModel(items: accItem)
                accSection.append(section)
            }
            let model = MobileCarouselViewerModel(sections: accSection)
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
        let test1 = collecionOdTestData.reduce([]){$0 + $1.sections}.reduce([]) { $0 + $1.items }.reduce([]){$0 + $1.dots}.map({$0.articleID})
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock() {
            self.testBenchExample()
        }
    }
    
}
