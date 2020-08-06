//  ___FILEHEADER___

import UIKit

class BaseCoordinator: NSObject, CoordinatorProtocol, ParentCoordinatorDelegate {
    
    // MARK: Private set public get properties
    
    private (set) weak var viewController : UIViewController?

    private (set) var childCoordinators   : [CoordinatorProtocol] = []
    
    
    // MARK: Public properties
    
    weak var parentCoordinatorDelegate    : ParentCoordinatorDelegate?
    
    
    // MARK: Lifecycle
    
    @discardableResult
    func start() -> UIViewController? {
        
        let createdViewController = createViewController()
        
        viewController = createdViewController
        
        return createdViewController
    }
    
    func finish() {
        
        parentCoordinatorDelegate?.coordinatorDidFinish(self)
    }
    
    
    // MARK: Public methods
    
    public func createViewController() -> UIViewController? {
        
        fatalError("BaseCoordinator subclasses need to implement the `createViewController()` method.")
    }
    
    @discardableResult
    func startChild(_ coordinator: CoordinatorProtocol) -> UIViewController? {
        
        childCoordinators.append(coordinator)
        coordinator.parentCoordinatorDelegate = self
        
        return coordinator.start()
    }
    
    public func removeAllChildCoordinators() {
        
        childCoordinators.removeAll()
    }
    
    
    // Mark: - ParentCoordinatorDelegate implementation
    
    func push(_ viewControllerToPush: UIViewController, animated: Bool) {
        
        if let navigationController = viewController as? UINavigationController {
            navigationController.setViewControllers([viewControllerToPush], animated: true)
            return
        }
        
        guard (self.viewController as? UITabBarController == nil) else {
            print("Can't push \(viewControllerToPush) in UITabBarController \(self)")
            return
        }
        
        viewController?.navigationController?.pushViewController(viewControllerToPush, animated: animated)
    }
    
    func pop(animated: Bool) {
        
        viewController?.navigationController?.popViewController(animated: animated)
    }
    
    func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)?) {
        
        viewController?.present(viewControllerToPresent, animated: flag, completion: completion)
    }
    
    func dismiss(_ viewControllerToDismiss: UIViewController, animated flag: Bool, completion: (() -> Void)?) {
        
        viewControllerToDismiss.dismiss(animated: flag, completion: completion)
    }
    
    func switchRootTo(_ coordinator: CoordinatorProtocol) {
        
        guard parentCoordinatorDelegate == nil else {
            parentCoordinatorDelegate?.switchRootTo(coordinator)
            return
        }
        
        fatalError("BaseCoordinator's subclasses need to implement the `switchRootTo:` method in case subclasses are root.")
    }
    
    func coordinatorDidFinish(_ coordinator: CoordinatorProtocol) {
        
        childCoordinators.removeAll(where: { $0 == coordinator })
    }

}
