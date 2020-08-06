//  ___FILEHEADER___

import UIKit

protocol CoordinatorProtocol: NSObject {
    
    var parrentCoordinator: CoordinatorProtocol? { get set }
    var childCoordinators: [CoordinatorProtocol] { get }
    
    @discardableResult
    func start() -> UIViewController?
    
    func finish()
    
    @discardableResult
    func startChild(coordinator: CoordinatorProtocol) -> UIViewController?
    
    func finishChild(coordinator: CoordinatorProtocol)
    
    func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)?)
    
    func dismiss(animated flag: Bool, completion: (() -> Void)?)
    
    func pushViewController(_ viewController: UIViewController, animated: Bool)
    
    @discardableResult
    func popViewController(animated: Bool) -> UIViewController?
    
    @discardableResult
    func popToRootViewController(animated: Bool) -> [UIViewController]?
    
    func switchNavigationRootCoordinator(_ coordinator: CoordinatorProtocol, animated: Bool)
    
    func setTabBarControllerSelectedIndex(_ selectedIndex: Int)
    
    func switchRootCoordinator(_ coordinator: CoordinatorProtocol)
    
}
