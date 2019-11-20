//  ___FILEHEADER___

import UIKit

class BaseNavigationCoordinator: BaseCoordinator {

    // MARK: Private properties
    
    private var rootCoordinator: CoordinatorProtocol?
    
    
    // MARK: Lifecycle
    
    init(rootCoordinator: CoordinatorProtocol?) {
        super.init()
        
        self.rootCoordinator = rootCoordinator
    }
    
    override func start() -> UIViewController? {
        
        return super.start()
    }
    
    
    // MARK: Public methods
    
    override func createViewController() -> UIViewController? {
        
        if let rootCoordinator = rootCoordinator {
            
            if let viewController = rootCoordinator.start() {
                
                rootCoordinator.parentCoordinatorDelegate = self
                
                return UINavigationController(rootViewController: viewController)
            }
        }
        
        return UINavigationController(nibName: nil, bundle: nil)
    }
    
}
