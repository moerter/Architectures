import UIKit

// MARK: - Implementation

internal class AddView: UIView {
  
  var firstNameTextField: UITextField
  var lastNameTextField: UITextField
  
  var stackView: UIStackView
  
  // MARK: - Init
  
  override init(frame: CGRect) {
    
    firstNameTextField = UITextField(frame: .zero)
    firstNameTextField.clearButtonMode = .whileEditing
    firstNameTextField.placeholder = "First name"
    firstNameTextField.borderStyle = .roundedRect
    
    lastNameTextField = UITextField(frame: .zero)
    lastNameTextField.clearButtonMode = .whileEditing
    lastNameTextField.placeholder = "Last name"
    lastNameTextField.borderStyle = .roundedRect
    
    stackView = UIStackView(arrangedSubviews: [firstNameTextField, lastNameTextField])
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.alignment = .fill
    stackView.axis = .vertical
    stackView.spacing = 20.0
    
    super.init(frame: frame)
    
    self.addSubview(stackView)
    
    backgroundColor = .white
    createConstraints()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func createConstraints() {
    stackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 100.0).isActive = true
    stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20.0).isActive = true
    stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20.0).isActive = true
  }
}
