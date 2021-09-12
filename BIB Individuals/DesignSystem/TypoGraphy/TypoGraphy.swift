//
//  TypoGraphy.swift
//  BIB Individuals
//
//  Created by Mahmoud Sherbeny on 12/09/2021.
//

import UIKit

extension DesignSystem {
    enum TypoGraphy {
        case title
        case description
        case header
        
        private var fontDescription: FontDescription {
            switch self {
            case .title:
                return FontDescription(font: .bold, size: 20, style: .largeTitle)
            case .description:
                return FontDescription(font: .regular, size: 16, style: .body)
            case .header:
                return FontDescription(font: .semiBold, size: 16, style: .headline)
            }
        }
        
        var font: UIFont {
            guard let font = UIFont(name: fontDescription.font.name, size: fontDescription.size) else {
                return UIFont.preferredFont(forTextStyle: fontDescription.style)
            }
            let fontMetrics = UIFontMetrics(forTextStyle: fontDescription.style)
            return fontMetrics.scaledFont(for: font)
        }
    }
}
