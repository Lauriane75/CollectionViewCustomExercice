//
//  DetailViewController.swift
//  CollectionViewCustomExercice
//
//  Created by Lau on 02/06/2021.
//

import UIKit

class DetailViewController: UIViewController {
    
    // MARK: - Outlets
    
    private var stackView = UIStackView()
    
    private let label: CustomLabel
    
    // MARK: - Properties
    
    var viewModel: DetailViewModel!
    
    // MARK: - Initializer
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        
        self.label = CustomLabel(color: .white, textFont: Constant.font.font16)
        
        stackView.addArrangedSubview(label)
        
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - View life cycle
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .red
        
        addElementsToSubview()
        
        setElementConstraints()
        
        bind(to: viewModel)
        
        viewModel.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        viewModel.viewWillAppear()
        
    }
    
    // MARK: - Action
    
    
    
    // MARK: - Private Functions
    
    private func addElementsToSubview() {
        view.addSubview(label)
        
    }
    
    private func setElementConstraints() {
        label.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1).isActive = true
        label.widthAnchor.constraint(equalTo: view.widthAnchor, constant: 0.8).isActive = true
    }
    
    private func bind(to viewModel: DetailViewModel) {
        viewModel.labelText = { [weak self] text in
            self?.label.text = text
        }
    }
    
    
}
