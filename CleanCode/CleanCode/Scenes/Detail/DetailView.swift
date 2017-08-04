import UIKit

// MARK: - Implementation

internal class DetailView: UIView {
  
  var firstNameLabel: UILabel
  var lastNameLabel: UILabel
  var streetNameLabel: UILabel
  var zipNameLabel: UILabel
  var cityNameLabel: UILabel
  
  var stackView: UIStackView
  
  // MARK: - Init
  
  override init(frame: CGRect) {
    
    firstNameLabel = UILabel(frame: .zero)
    lastNameLabel = UILabel(frame: .zero)
    streetNameLabel = UILabel(frame: .zero)
    zipNameLabel = UILabel(frame: .zero)
    cityNameLabel = UILabel(frame: .zero)
    
    stackView = UIStackView(arrangedSubviews: [firstNameLabel, lastNameLabel, streetNameLabel, zipNameLabel, cityNameLabel])
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
