//  ___FILEHEADER___

import UIKit

class ___VARIABLE_productName___ViewController: UIViewController {
  
    // MARK: IBOutlets
    
    
    // MARK: Public properties
    
    
    // MARK: Private properties
    
    private var viewModel: ___VARIABLE_productName___ViewModelProtocol!
    
    
    // MARK: Lifecycle
    
    
    // MARK: Public methods
    
    
    // MARK: Private methods
    
    
}


// MARK: Helper - Xib initialization

extension ___VARIABLE_productName___ViewController {
    
    static func xibInit(viewModel: ___VARIABLE_productName___ViewModelProtocol) -> ___VARIABLE_productName___ViewController {
        
        let viewController = ___VARIABLE_productName___ViewController(nibName: "___VARIABLE_productName___ViewController", bundle: nil)
        viewController.viewModel = viewModel
        
        return viewController
    }
}
