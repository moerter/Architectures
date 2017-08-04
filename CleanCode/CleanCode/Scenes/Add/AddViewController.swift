import UIKit

// MARK: - Protocols

protocol AddDisplayLogic: class {
  func displayList(viewModel: Add.Person.ViewModel)
}

// MARK: - Implementation

class AddViewController: UIViewController, AddDisplayLogic {
  var interactor: AddBusinessLogic?
  var router: (AddRoutingLogic & AddDataPassing)?
  
  /// the view that is displayed
  private var mainView: AddView? {
    return view as? AddView
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
    
    view = AddView()
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    title = "Add"
    
    navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(dismissView))
    navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(savePerson))
  }
  
  // MARK: Setup
  
  /// Setup the scene
  private func setup() {
    let viewController = self
    let interactor = AddInteractor()
    let presenter = AddPresenter()
    let router = AddRouter()
    viewController.interactor = interactor
    viewController.router = router
    interactor.presenter = presenter
    presenter.viewController = viewController
    router.viewController = viewController
    router.dataStore = interactor
  }
  
  // MARK: Button Actions
  
  @objc func savePerson() {
    let firstname = mainView?.firstNameTextField.text ?? ""
    let lastname = mainView?.lastNameTextField.text ?? ""
    
    let request = Add.Person.Request(firstName: firstname, lastName: lastname)
    interactor?.savePerson(request: request)
  }
  
  @objc func dismissView() {
    router?.dismissView()
  }
  
  // MARK: - AddDisplayLogic
  
  func displayList(viewModel: Add.Person.ViewModel) {
    dismissView()
  }
}
