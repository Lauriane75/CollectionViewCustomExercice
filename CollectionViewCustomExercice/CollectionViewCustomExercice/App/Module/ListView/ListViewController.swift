//
//  ViewController.swift
//  CollectionViewCustomExercice
//
//  Created by Lau on 02/06/2021.
//


import UIKit

class ListViewController: UIViewController {
    
    // MARK: - Outlets
    
    private var stackView = UIStackView()
    
    private let detailButton: CustomButton
    
    // MARK: - Properties
    
    var viewModel: ListViewModel!
    
    // MARK: - Initializer
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        self.detailButton = CustomButton(textColor: .white, withBackgroundColor: .purple, font: Constant.font.font16, cornerRadius: 15)
        
        stackView.addArrangedSubview(detailButton)
        
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
        
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
    
    @objc func didPressDetailButton() {
        viewModel.didPressDetailButton()
    }
    
    // MARK: - Private Functions
    
    private func addElementsToSubview() {
        view.addSubview(detailButton)
    }
    
    private func setElementConstraints() {
        detailButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30).isActive = true
        detailButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        detailButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.08).isActive = true
        detailButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive = true
        
        detailButton.addTarget(self, action: #selector(didPressDetailButton), for: .touchUpInside)
    }
    
    // MARK: - Action
    
    // MARK: - Private Functions
    
    fileprivate func bind(to viewModel: ListViewModel) {
        viewModel.buttonText = { [weak self] text in
            self?.detailButton.setTitle(text, for: .normal)
        }
    }
    
    
    
    
}

