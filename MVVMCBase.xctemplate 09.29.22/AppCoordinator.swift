//  ___FILEHEADER___

import UIKit

class AppCoordinator: BaseCoordinator {

    // MARK: Private properties
    
    private weak var window: UIWindow?
    
    private var initialCoordinator: CoordinatorProtocol?
    
    
    // MARK: Lifecycle
    
    required init(window: UIWindow?, initialCoordinator: CoordinatorProtocol) {
        super.init()
        
        self.window = window
        self.initialCoordinator = initialCoordinator
    }
    
    override func start() -> UIViewController? {
        
        return initialStart()
    }
    
    
    // MARK: Private methods
    
    @discardableResult
    private func initialStart() -> UIViewController? {
        
        if let childCoordinator = initialCoordinator {
            
            let vc = startChild(childCoordinator)
            
            window?.rootViewController = vc
            window?.makeKeyAndVisible()
            
            initialCoordinator = nil
            
            return vc
        }
        
        return nil
    }
    
    
    // MARK: switchRootTo: implementation
    
    override func switchRootTo(_ coordinator: CoordinatorProtocol) {
        
        removeAllChildCoordinators()
        
        initialCoordinator = coordinator
        
        initialStart()
    }
    
}
