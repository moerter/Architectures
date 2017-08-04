import UIKit

// MARK: - Protocols

protocol AddRoutingLogic {
  func dismissView()
}

protocol AddDataPassing {
  var dataStore: AddDataStore? { get }
}

// MARK: - Implementation

class AddRouter: AddRoutingLogic, AddDataPassing {
  weak var viewController: AddViewController?
  var dataStore: AddDataStore?
  
  internal func dismissView() {
    viewController?.dismiss(animated: true, completion: nil)
  }
}
