// MARK: - Protocols

protocol DetailPresentationLogic {
  func presentPerson(response: Detail.GetPerson.Response)
}

// MARK: - Implementation

class DetailPresenter: DetailPresentationLogic {
  weak var viewController: DetailDisplayLogic?
  
  // MARK: - DetailPresentationLogic
  
  func presentPerson(response: Detail.GetPerson.Response) {
    
    let person = response.person
    let displayPerson = Detail.GetPerson.ViewModel.DisplayPerson(firstName: person.firstName, lastName: person.lastName)
    
    let viewModel = Detail.GetPerson.ViewModel(displayPerson: displayPerson)
    viewController?.displayPerson(viewModel: viewModel)
  }
}
