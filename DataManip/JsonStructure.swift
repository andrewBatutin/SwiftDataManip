//
//  DataManipPlgrnd.swift
//  DataManip
//
//  Created by Batutin, Andriy on 12/1/14.
//  Copyright (c) 2014 Batutin, Andriy. All rights reserved.
//

import Foundation


public struct TopLevelCollection{
    let oneStepDownCollection:[OneStepDownCollection]
}

public struct OneStepDownCollection{
    let twoStepDownCollection:[TwoStepDownCollection]
}

public struct TwoStepDownCollection{
    let threeStepDownCollection:[ThreeStepDownCollection]
}

public struct ThreeStepDownCollection{
    let articleID:String
}
