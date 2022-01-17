//
//  JGenericViewModel.swift
//  Joblogic
//
//  Created by Ryan on 16/01/2022.
//

import Foundation

class JGenericListViewModel<T> {
    
    var objectsVM: [JGenericViewModel<T>] = []
    
    init(objectsVM: [JGenericViewModel<T>]) {
        self.objectsVM = objectsVM
    }
    
    func itemVMAt(_ index: Int) -> JGenericViewModel<T>? {
        return self.objectsVM[index]
    }
}

struct JGenericViewModel<T> {
    let object: T?
    
    func getItem() -> T? {
        return object
    }
}
