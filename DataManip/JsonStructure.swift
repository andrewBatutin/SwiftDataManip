//
//  DataManipPlgrnd.swift
//  DataManip
//
//  Created by Batutin, Andriy on 12/1/14.
//  Copyright (c) 2014 Batutin, Andriy. All rights reserved.
//

import Foundation


public struct TopLevelCollection{
    let sections:[OneStepDownCollection]
}

public struct OneStepDownCollection{
    let items:[TwoStepDownCollection]
}

public struct TwoStepDownCollection{
    let dots:[ThreeStepDownCollection]
}

public struct ThreeStepDownCollection{
    let articleID:String
}
