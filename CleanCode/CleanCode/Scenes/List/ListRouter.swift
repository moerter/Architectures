import UIKit

// MARK: - Protocols

protocol ListRoutingLogic {
  func routeToDetailScene(source: ListViewController, destination: DetailViewController)
  func routeToAddScrene(source: ListViewController, destination: UINavigationController)
}

protocol ListDataPassing {
  var dataStore: ListDataStore? { get }
}

// MARK: - Implementation

class ListRouter: ListRoutingLogic, ListDataPassing {
  weak var viewController: ListViewController?
  var dataStore: ListDataStore?
  
  // MARK: - ListRoutingLogic
  
  func routeToDetailScene(source: ListViewController, destination: DetailViewController) {
    var destinationDS = destination.router!.dataStore!
    
    passDataToDetailScene(source: dataStore!, destination: &destinationDS)
    navigateToDetailScene(source: source, destination: destination)
  }
  
  func routeToAddScrene(source: ListViewController, destination: UINavigationController) {
    navigateToAddScene(source: source, destination: destination)
  }
  
  // MARK: Data passing
  
  private func passDataToDetailScene(source: ListDataStore, destination: inout DetailDataStore) {
    let selectedIndex = viewController?.mainView?.tableView.indexPathForSelectedRow?.row
    let person = dataStore?.persons[selectedIndex!]
    
    destination.person = person
  }
  
  // MARK: Navigation
  
  private func navigateToDetailScene(source: ListViewController, destination: DetailViewController) {
    source.navigationController?.pushViewController(destination, animated: true)
  }
  
  private func navigateToAddScene(source: ListViewController, destination: UINavigationController) {
    source.show(destination, sender: nil)
  }
}
