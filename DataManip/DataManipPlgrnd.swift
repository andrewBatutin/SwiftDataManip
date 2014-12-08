//
//  DataManipPlgrnd.swift
//  DataManip
//
//  Created by Batutin, Andriy on 12/1/14.
//  Copyright (c) 2014 Batutin, Andriy. All rights reserved.
//

import Foundation


public struct MobileCarouselViewerModel{
    let sections:[MobileCarouselViewerSectionModel]
}

public struct MobileCarouselViewerSectionModel{
    let items:[MobileCarouselViewerItemModel]
}

public struct MobileCarouselViewerItemModel{
    let dots:[ImageControlsModel]
}

public struct ImageControlsModel{
    let articleID:String
}
