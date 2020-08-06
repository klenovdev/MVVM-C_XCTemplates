//  ___FILEHEADER___

import UIKit

class TabBarCoordinator: BaseCoordinator {
    
    // MARK: Private properties
    
    private var rootCoordinators: [CoordinatorProtocol] = []
    
    
    // MARK: Lifecycle
    
    init(rootCoordinators: [CoordinatorProtocol]) {
        super.init()
        
        self.rootCoordinators = rootCoordinators
    }
    
    override func createViewController() -> UIViewController? {
        
        var viewControllers: [UIViewController] = []
        
        for coordinator in rootCoordinators {
            
            coordinator.parrentCoordinator = self
            
            if let viewController = coordinator.start() {
                viewControllers.append(viewController)
            }
        }
        
        let tabBarController = TabBarController(nibName: nil, bundle: nil)
        tabBarController.setViewControllers(viewControllers, animated: false)
        
        return tabBarController
    }
    
    
    // MARK: Public methods
    
    override func setTabBarControllerSelectedIndex(_ selectedIndex: Int) {
        
        if let tabBarController = viewController as? UITabBarController {
            tabBarController.selectedIndex = selectedIndex
        }
    }
    
}
