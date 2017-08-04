// MARK: - Protocols

protocol ListPresentationLogic {
  func presentPersons(response: List.Persons.Response)
}

// MARK: - Implementation

class ListPresenter: ListPresentationLogic {
  weak var viewController: ListDisplayLogic?
  
  // MARK: - ListPresentationLogic
  
  func presentPersons(response: List.Persons.Response) {
    
    var displayPersons: [List.Persons.ViewModel.DisplayPerson] = []
    for person in response.persons {
      let displayPerson = List.Persons.ViewModel.DisplayPerson(firstName: person.firstName, lastName: person.lastName)
      displayPersons.append(displayPerson)
    }
    
    let viewModel = List.Persons.ViewModel(displayPersons: displayPersons)
    viewController?.displayPersons(viewModel: viewModel)
  }
}
