enum List {
  enum Persons {
    struct Request {
    }
    
    struct Response {
      var persons: [Person]
    }
    
    struct ViewModel {
      struct DisplayPerson {
        var firstName: String
        var lastName: String
      }
      
      var displayPersons: [DisplayPerson]
    }
  }
}
