//  ___FILEHEADER___

import UIKit

class AppCoordiantor: BaseCoordinator {
    
    // MARK: Private properties
    
    private var window          : UIWindow
    private var rootCoordinator : CoordinatorProtocol? {
        didSet {
            rootCoordinator?.parrentCoordinator = self
        }
    }
    
    
    // MARK: Lifecycle
    
    init(window: UIWindow, rootCoordinator: CoordinatorProtocol) {
        self.window          = window
        self.rootCoordinator = rootCoordinator
    }

    @discardableResult
    override func start() -> UIViewController? {
        
        rootCoordinator?.parrentCoordinator = self
        
        let rootViewController = rootCoordinator?.start()
        
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
        
        return rootViewController
    }
    
    
    // MARK: Public methods
    
    override func switchRootCoordinator(_ coordinator: CoordinatorProtocol) {
        
        rootCoordinator = coordinator
        
        start()
    }
    
}
