//
//  AppDelegate.swift
//  DataManip
//
//  Created by Batutin, Andriy on 12/1/14.
//  Copyright (c) 2014 Batutin, Andriy. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        testSwiftSucks()
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    func testSwiftSucks(){
        let data = generateDataSet("Bitch", numberOfItems: 10)
        var start = NSDate()
        let test1 = data.reduce([]){$0 + $1.sections}.reduce([]) { $0 + $1.items }.reduce([]){$0 + $1.dots}
        let timeInt = start.timeIntervalSinceNow
        NSLog("Interval %lf", fabs(timeInt))
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
    
}

