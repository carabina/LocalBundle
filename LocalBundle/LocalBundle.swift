//
//  LocalBundle.swift
//  LocalBundle
//
//  Created by Felipe Ricieri on 06/10/17.
//  Copyright © 2017 Ricieri ME. All rights reserved.
//

import Foundation

public enum LocalBundleError: Error {
    case arrayNotFound
}

open class LocalBundle {
    
    private(set) static var bundle: UserDefaults = {
        return UserDefaults.standard
    }()
    
    // MAK: - 👨🏻‍💻 Additional Methods
    
    open class func append<T: Equatable>(object: T, inKey key: String) throws {
        guard var array = bundle.object(forKey: key) as? [T] else { throw LocalBundleError.arrayNotFound }
        array.append(object)
        bundle.set(array, forKey: key)
        bundle.synchronize()
    }
    
    // MARK: - 👨🏻‍💻 Main Methods
    
    open class func get(_ key: String) -> Any? {
        return bundle.object(forKey: key)
    }
    
    open class func save(value: String, forKey key: String) {
        bundle.set(value, forKey: key)
        bundle.synchronize()
    }
    
    open class func remove(value: String, forKey key: String) {
        bundle.removeObject(forKey: key)
        bundle.synchronize()
    }
}
