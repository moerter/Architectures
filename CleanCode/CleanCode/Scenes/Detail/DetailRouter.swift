import UIKit

// MARK: - Protocols

protocol DetailRoutingLogic { }

protocol DetailDataPassing {
  var dataStore: DetailDataStore? { get }
}

// MARK: - Implementation

class DetailRouter: DetailRoutingLogic, DetailDataPassing {
  weak var viewController: DetailViewController?
  var dataStore: DetailDataStore?
}
