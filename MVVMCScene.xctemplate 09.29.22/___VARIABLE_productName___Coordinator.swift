//  ___FILEHEADER___

import UIKit

class ___VARIABLE_productName___Coordinator: BaseCoordinator {
  
    // MARK: Public properties
    
    
    // MARK: Private properties
    
    private var viewModel: ___VARIABLE_productName___ViewModelProtocol?

    
    // MARK: Lifecycle
    
    required init(viewModel: ___VARIABLE_productName___ViewModelProtocol?) {
        
        super.init()
        
        self.viewModel = viewModel
        self.viewModel?.coordinator = self
    }
    
    override func start() -> UIViewController? {
        
        if let newViewController = super.start() {
            
            parentCoordinatorDelegate?.push(newViewController, animated: true)
            
            return newViewController
        }

        return nil
    }
    
    
    // MARK: Public methods
    
    override func createViewController() -> UIViewController? {
        
       guard let sceneViewModel = viewModel else {
            return nil
        }
        
        let sceneViewController = ___VARIABLE_productName___ViewController.xibInit(viewModel: sceneViewModel)
        
        viewModel = nil
        
        return sceneViewController
    }
    
}


// MARK: ___VARIABLE_productName___CoordinatorProtocol implementation

extension ___VARIABLE_productName___Coordinator: ___VARIABLE_productName___CoordinatorProtocol {
    
}
