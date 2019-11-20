//  ___FILEHEADER___

import Foundation

class ___VARIABLE_productName___ViewModel {
  
    // MARK: Public properties
    
    weak var coordinator: ___VARIABLE_productName___CoordinatorProtocol?
    
    
    // MARK: Private properties
    
    
    // MARK: Lifecycle
    
    deinit {
        coordinator?.finish()
    }
    
    
    // MARK: Public methods
    
    
    // MARK: Private methods
    
}


// MARK: ___VARIABLE_productName___ViewModelProtocol implementation

extension ___VARIABLE_productName___ViewModel: ___VARIABLE_productName___ViewModelProtocol {
    
}
