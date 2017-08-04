import UIKit

// MARK: - Protocols

protocol DetailDisplayLogic: class {
  func displayPerson(viewModel: Detail.GetPerson.ViewModel)
}

// MARK: - Implementation

class DetailViewController: UIViewController, DetailDisplayLogic {
  var interactor: DetailBusinessLogic?
  var router: (DetailRoutingLogic & DetailDataPassing)?
    
  /// the view that is displayed
  private var mainView: DetailView? {
    return view as? DetailView
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
    
    view = DetailView()
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    getPerson()
  }
  
  // MARK: Setup
  
  /// Setup the scene
  private func setup() {
    let viewController = self
    let interactor = DetailInteractor()
    let presenter = DetailPresenter()
    let router = DetailRouter()
    viewController.interactor = interactor
    viewController.router = router
    interactor.presenter = presenter
    presenter.viewController = viewController
    router.viewController = viewController
    router.dataStore = interactor
  }
  
  // MARK: Initial data loading
  
  func getPerson() {
    let request = Detail.GetPerson.Request()
    interactor?.getPerson(request: request)
  }
  
  // MARK: - DetailDisplayLogic
  
  func displayPerson(viewModel: Detail.GetPerson.ViewModel) {
    mainView?.firstNameLabel.text = viewModel.displayPerson.firstName
    mainView?.lastNameLabel.text = viewModel.displayPerson.lastName
  }
}
