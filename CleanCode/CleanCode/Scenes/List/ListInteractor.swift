// MARK: - Protocols

protocol ListBusinessLogic {
  func loadPersons(request: List.Persons.Request)
}

protocol ListDataStore {
  var persons: [Person] { get }
}

// MARK: - Implementation

class ListInteractor: ListBusinessLogic, ListDataStore {
  var presenter: ListPresentationLogic?
  lazy var worker: PersonWorker = PersonWorker()
  
  var persons: [Person] = []
  
  // MARK: - ListBusinessLogic
  
  func loadPersons(request: List.Persons.Request) {
    persons = worker.loadPersons()
    
    let response = List.Persons.Response(persons: persons)
    presenter?.presentPersons(response: response)
  }
}
