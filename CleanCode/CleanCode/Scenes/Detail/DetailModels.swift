enum Detail {
  enum GetPerson {
    struct Request {
    }
    
    struct Response {
      var person: Person
    }
    
    struct ViewModel {
      struct DisplayPerson {
        var firstName: String
        var lastName: String
      }
      
      var displayPerson: DisplayPerson
    }
  }
}
