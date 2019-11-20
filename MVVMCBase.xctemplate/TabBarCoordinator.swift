//  ___FILEHEADER___

import UIKit

class TabBarCoordinator: BaseCoordinator {

    // MARK: Private properties
    
    private var tabRootCoordinators: [CoordinatorProtocol]?
    
    
    // MARK: Lifecycle
    
    init(tabRootCoordinators: [CoordinatorProtocol]?) {
        super.init()
        
        self.tabRootCoordinators = tabRootCoordinators
    }
    
    override func start() -> UIViewController? {
        
        return super.start()
    }
    
    
    // MARK: Public methods
    
    override func createViewController() -> UIViewController? {
        
        if let rootCoordinators = tabRootCoordinators {
            
            var viewControllers: [UIViewController] = []
            
            for rootCoordinator in rootCoordinators {
                if let viewController = rootCoordinator.start() {
                    viewControllers.append(viewController)
                }
            }
            
            let tabBarController = UITabBarController(nibName: nil, bundle: nil)
            
            tabBarController.setViewControllers(viewControllers, animated: false)
            
            for rootCoordinator in rootCoordinators {
                rootCoordinator.parentCoordinatorDelegate = self
            }
        
            return tabBarController
        }
        
        return UINavigationController(nibName: nil, bundle: nil)
    }
    
}
