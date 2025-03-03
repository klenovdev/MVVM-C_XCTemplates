//  ___FILEHEADER___

import UIKit

class BaseCoordinator: NSObject, CoordinatorProtocol {
    
    // MARK: Public properties
    
    public weak var parrentCoordinator: CoordinatorProtocol?
    
    
    // MARK: Private (set) properties
    
    private (set) var childCoordinators: [CoordinatorProtocol] = []
    private (set) weak var viewController: UIViewController?
    
    
    // MARK: Lifecycle
    
    public func start() -> UIViewController? {
        
        print("[\(type(of: self))]: Start")
        
        let newViewController = createViewController()
        
        viewController = newViewController
        
        return newViewController
    }
    
    public func createViewController() -> UIViewController? {
        
        fatalError("BaseCoordinator subclass must override createViewController method")
    }
    
    public func finish() {
        
        parrentCoordinator?.finishChild(coordinator: self)
    }
    
    deinit {
        print("[\(type(of: self))]: Deinit")
    }
    
    
    // MARK: Public methods
    
    @discardableResult
    public func startChild(coordinator: CoordinatorProtocol) -> UIViewController? {
        
        childCoordinators.append(coordinator)
        
        coordinator.parrentCoordinator = self
        
        return coordinator.start()
    }
    
    public func finishChild(coordinator: CoordinatorProtocol) {
        
        childCoordinators.removeAll(where: { $0 == coordinator })
    }
    
    public func pushViewController(_ viewController: UIViewController, animated: Bool) {
        
        self.viewController?.navigationController?.pushViewController(viewController, animated: animated)
    }
    
    @discardableResult
    public func popViewController(animated: Bool) -> UIViewController? {
        
        return viewController?.navigationController?.popViewController(animated: animated)
    }
    
    @discardableResult
    public func popToRootViewController(animated: Bool) -> [UIViewController]? {
        
        return viewController?.navigationController?.popToRootViewController(animated: animated)
    }
    
    public func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)?) {
        
        viewController?.present(viewControllerToPresent, animated: flag, completion: completion)
    }
    
    public func dismiss(animated flag: Bool, completion: (() -> Void)?) {
        
        viewController?.dismiss(animated: flag, completion: completion)
    }
        
    func switchNavigationRootCoordinator(_ coordinator: CoordinatorProtocol, animated: Bool) {
        
        parrentCoordinator?.switchNavigationRootCoordinator(coordinator, animated: animated)
    }
    
    public func switchRootCoordinator(_ coordinator: CoordinatorProtocol) {
        
        parrentCoordinator?.switchRootCoordinator(coordinator)
    }
    
    func setTabBarControllerSelectedIndex(_ selectedIndex: Int) {
        
        parrentCoordinator?.setTabBarControllerSelectedIndex(selectedIndex)
    }
    
}
