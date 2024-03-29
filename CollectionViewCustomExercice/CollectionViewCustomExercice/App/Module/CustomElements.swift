//
//  CustomElements.swift
//  CollectionViewCustomExercice
//
//  Created by Lau on 02/06/2021.
//


import UIKit

class CustomView: UIView {
    convenience init(backgroundUIColor: UIColor) {
        self.init()
        backgroundColor = backgroundUIColor
        translatesAutoresizingMaskIntoConstraints = false
    }
}

class CustomLabel: UILabel {
    convenience init(color: UIColor, textFont: UIFont) {
        self.init()
        textColor = color
        font = textFont
        numberOfLines = 0
        textAlignment = .center
        translatesAutoresizingMaskIntoConstraints = false
    }
}

class CustomButton: UIButton {
    convenience init(textColor: UIColor, withBackgroundColor: UIColor?, font: UIFont, cornerRadius: CGFloat?) {
        self.init()
        setTitleColor(textColor, for: .normal)
        titleLabel?.font = font
        backgroundColor = withBackgroundColor
        layer.cornerRadius = cornerRadius ?? 0
        translatesAutoresizingMaskIntoConstraints = false
    }
}

class CustomTextField: UITextField {
    convenience init(typeKeyboard: UIKeyboardType, uiFont: UIFont) {
        self.init()
        textColor = .white
        font = uiFont
        keyboardAppearance = .dark
        keyboardType = typeKeyboard
        layer.cornerRadius = 10
        textAlignment = .left
        backgroundColor = .white
        translatesAutoresizingMaskIntoConstraints = false
    }
}

extension UIImageView {
    convenience init(imageName: String) {
        self.init()
        image = UIImage(named: imageName)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func loadImage(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}

extension UIStackView {
    convenience init(name: String) {
        self.init()
        axis = .vertical
        alignment = .fill
        distribution = .fill
        translatesAutoresizingMaskIntoConstraints = false
    }
}

class CustomCollectionView: UICollectionView {
    convenience init(uiBackGroundColor: UIColor) {
        self.init()
        backgroundColor = uiBackGroundColor
        translatesAutoresizingMaskIntoConstraints = false
    }
}




