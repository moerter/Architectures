// MARK: - Protocols

protocol AddBusinessLogic {
  func savePerson(request: Add.Person.Request)
}

protocol AddDataStore {
  //var name: String { get set }
}

// MARK: - Implementation

class AddInteractor: AddBusinessLogic, AddDataStore {
  var presenter: AddPresentationLogic?
  lazy var worker: PersonWorker = PersonWorker()
  
  // MARK: - AddBusinessLogic
  
  func savePerson(request: Add.Person.Request) {
    let person = Person(firstName: request.firstName, lastName: request.lastName)
    worker.saveNewPerson(person: person)
    
    let response = Add.Person.Response()
    presenter?.presentList(response: response)
  }
}
