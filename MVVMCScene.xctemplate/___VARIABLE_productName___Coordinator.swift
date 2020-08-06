//  ___FILEHEADER___

import UIKit

class ___VARIABLE_productName___Coordinator: BaseCoordinator {
  
    // MARK: Private properties
    
    private var viewModel: ___VARIABLE_productName___ViewModelProtocol?

    
    // MARK: Lifecycle
    
    required init(viewModel: ___VARIABLE_productName___ViewModelProtocol?) {
        
        super.init()
        
        self.viewModel = viewModel
        self.viewModel?.coordinator = self
    }
    
    override func start() -> UIViewController? {
        
        if let viewController = super.start() {
            
            parrentCoordinator?.pushViewController(viewController, animated: true)
            
            return viewController
        }

        return nil
    }
    
    
    // MARK: Public methods
    
    override func createViewController() -> UIViewController? {
        
        guard let sceneViewModel = viewModel else {
            return nil
        }
        
        let viewController = ___VARIABLE_productName___ViewController(viewModel: sceneViewModel)
        
        viewModel = nil
        
        return viewController
    }
    
}


// MARK: ___VARIABLE_productName___CoordinatorProtocol implementation

extension ___VARIABLE_productName___Coordinator: ___VARIABLE_productName___CoordinatorProtocol {
    
}
