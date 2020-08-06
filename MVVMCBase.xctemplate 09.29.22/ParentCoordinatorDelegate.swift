//  ___FILEHEADER___

import UIKit

protocol ParentCoordinatorDelegate: class {
    
    func push(_ viewControllerToPush: UIViewController, animated: Bool)
    func pop(animated: Bool)
    
    func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)?)
    func dismiss(_ viewControllerToDismiss: UIViewController, animated flag: Bool, completion: (() -> Void)?)
    
    func switchRootTo(_ coordinator: CoordinatorProtocol)
    
    func coordinatorDidFinish(_ coordinator: CoordinatorProtocol)
    
}
