//
//  ListArrayObj.swift
//  ios todo
//
//  Created by Dinesh on 2019-12-08.
//  Copyright © 2019 dinesh. All rights reserved.
//

import UIKit
class ListArrayObj{
    var thingArray:[ListObject] = []
    init(){
        thingArray = [ListObject(thingsTitle: "play volleyball",doneBy: "09th dec"),ListObject(thingsTitle: "call friends", doneBy: "02nd dec"),ListObject(thingsTitle: "gym", doneBy: "05th dec")]
    }
    func createNewThing(listObject: ListObject){
        thingArray.append(listObject)
    }
    func removeThing(_ listObject1: ListObject){
        if let index = thingArray.firstIndex(of: listObject1){
            thingArray.remove(at: index)
        }
    }
    func moveThing(from fromIndex: Int, to toIndex:Int){
        let temp = thingArray[fromIndex]
        thingArray.remove(at: fromIndex)
        thingArray.insert(temp, at: toIndex)
    }
    }
    
