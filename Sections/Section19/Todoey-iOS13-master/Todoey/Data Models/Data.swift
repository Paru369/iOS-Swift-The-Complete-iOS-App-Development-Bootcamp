//
//  Data.swift
//  Todoey
//
//  Created by Paulo Pinheiro on 12/17/23.
//  Copyright © 2023 App Brewery. All rights reserved.
//

import Foundation
import RealmSwift


class Data: Object {
   @objc dynamic var name: String = ""
   @objc dynamic var age: Int = 0
}

