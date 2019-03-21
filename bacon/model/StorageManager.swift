//
//  StorageManager.swift
//  bacon
//
//  An API for all storage related functionalities.
//  Provides an abstraction over the underlying storage library dependacies.
//
//  Created by Travis Ching Jia Yea on 19/3/19.
//  Copyright © 2019 nus.CS3217. All rights reserved.
//

import Foundation

class StorageManager {
    private var concreteStorage: StorageCouchBaseDB

    init() throws {
        concreteStorage = try StorageCouchBaseDB()
    }

    // func loadTransaction() with different filters
}
