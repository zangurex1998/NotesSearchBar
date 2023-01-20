//
//  NoteCollectionViewCell.swift
//  NotesSearchBar
//
//  Created by technomix on 16.01.23.
//

import UIKit

class NoteCollectionViewCell: UICollectionViewCell {
    let label = UILabel()
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUpLabel()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpLabel()
    }
    
    private func setUpLabel(){
        addSubview(label)
        label.textColor = .white
        label.font = .systemFont(ofSize: 25, weight: .heavy)
        label.backgroundColor = .red
        label.textAlignment = .center
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        label.frame = .init(x: 0, y: 0, width: 100, height: 100)
    }
    
    func configure(with name : Note){
        label.text = name.header
    }
    
}
