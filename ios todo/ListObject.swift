//
//  ListObject.swift
//  ios todo
//
//  Created by Dinesh on 2019-12-08.
//  Copyright © 2019 dinesh. All rights reserved.
//

import UIKit
class ListObject:NSObject{
    var thingsTitle: String = ""
    var doneBy: String = ""
    var isCompletedOut: Bool = false
    
    override init(){
    }
    init(thingsTitle: String, doneBy:String){
        self.thingsTitle = thingsTitle
        self.doneBy = doneBy
    }
}
