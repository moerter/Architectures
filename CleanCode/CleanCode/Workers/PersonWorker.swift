import Foundation

class PersonWorker {
  
  let fileName = "persons.json"
  
  func loadPersons() -> [Person] {
    let fileURL = getDocumentUrl()
    print(fileURL)
    
    guard let jsonData = try? Data(contentsOf: fileURL) else {return [] }
    
    let jsonDecoder = JSONDecoder()
    
    guard let decodedPersons = try? jsonDecoder.decode([Person].self, from: jsonData) else {return [] }
    
    return decodedPersons
  }
  
  func saveNewPerson(person: Person) {
    var persons = loadPersons()
    
    persons.append(person)
    
    let encoder = JSONEncoder()
    guard let jsonData = try? encoder.encode(persons) else { return }
    
    let fileURL = getDocumentUrl()
    print(fileURL)
    
    do {
      try jsonData.write(to: fileURL)
    } catch {
      print("Could not save")
    }
    
  }
  
  private func getDocumentUrl() -> URL {
    let documentDirectory = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
    return documentDirectory.appendingPathComponent(fileName)
  }
}
