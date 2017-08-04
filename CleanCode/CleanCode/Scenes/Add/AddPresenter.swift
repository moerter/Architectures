// MARK: - Protocols

protocol AddPresentationLogic {
  func presentList(response: Add.Person.Response)
}

// MARK: - Implementation

class AddPresenter: AddPresentationLogic {
  weak var viewController: AddDisplayLogic?
  
  // MARK: - AddPresentationLogic
  
  func presentList(response: Add.Person.Response) {
    let viewModel = Add.Person.ViewModel()
    viewController?.displayList(viewModel: viewModel)
  }
}
