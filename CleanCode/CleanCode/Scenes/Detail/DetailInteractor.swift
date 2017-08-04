// MARK: - Protocols

protocol DetailBusinessLogic {
  func getPerson(request: Detail.GetPerson.Request)
}

protocol DetailDataStore {
  var person: Person! { get set }
}

// MARK: - Implementation

class DetailInteractor: DetailBusinessLogic, DetailDataStore {
  var presenter: DetailPresentationLogic?
  lazy var worker: PersonWorker = PersonWorker()
  
  var person: Person!
  
  // MARK: - DetailBusinessLogic
  
  func getPerson(request: Detail.GetPerson.Request) {
    let response = Detail.GetPerson.Response(person: person)
    presenter?.presentPerson(response: response)
  }
}
