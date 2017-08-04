import UIKit

// MARK: - Protocols

protocol ListDisplayLogic: class {
  func displayPersons(viewModel: List.Persons.ViewModel)
}

// MARK: - Implementation

class ListViewController: UIViewController, ListDisplayLogic {
  var interactor: ListBusinessLogic?
  var router: (ListRoutingLogic & ListDataPassing)?
  
  var persons: [List.Persons.ViewModel.DisplayPerson] = []
  
  /// the view that is displayed
  internal var mainView: ListView? {
    return view as? ListView
  }
  
  // MARK: Object lifecycle
  
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    
    setup()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: View lifecycle
  
  override func loadView() {
    super.loadView()
    
    view = ListView()
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    title = "Persons List"
    
    self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonPressed))
    
    mainView?.tableView.dataSource = self
    mainView?.tableView.delegate = self
    mainView?.tableView.register(BasicTableViewCell.self, forCellReuseIdentifier: "BasicTableViewCell")
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    loadPersons()
  }
  
  // MARK: Setup
  
  /// Setup the scene
  private func setup() {
    let viewController = self
    let interactor = ListInteractor()
    let presenter = ListPresenter()
    let router = ListRouter()
    viewController.interactor = interactor
    viewController.router = router
    interactor.presenter = presenter
    presenter.viewController = viewController
    router.viewController = viewController
    router.dataStore = interactor
  }
  
  // MARK: Initial data loading
  
  func loadPersons() {
    let request = List.Persons.Request()
    interactor?.loadPersons(request: request)
  }
  
  // MARK: Button Action
  
  @objc func addButtonPressed() {
    let addVC = AddViewController()
    let navigationVC = UINavigationController(rootViewController: addVC)
    router?.routeToAddScrene(source: self, destination: navigationVC)
  }
  
  // MARK: - ListDisplayLogic
  
  func displayPersons(viewModel: List.Persons.ViewModel) {
    persons = viewModel.displayPersons
    mainView?.tableView.reloadData()
  }
}
