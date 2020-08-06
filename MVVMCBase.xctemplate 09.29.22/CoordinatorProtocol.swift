//  ___FILEHEADER___

import UIKit

protocol CoordinatorProtocol: NSObject {

    var viewController            : UIViewController?           { get }
    var parentCoordinatorDelegate : ParentCoordinatorDelegate?  { get set }
    var childCoordinators         : [CoordinatorProtocol]       { get }
    
    @discardableResult
    func start() -> UIViewController?
    
    func finish()
    
}
