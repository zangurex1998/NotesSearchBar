//
//  NotesReviewViewController.swift
//  NotesSearchBar
//
//  Created by technomix on 16.01.23.
//

import UIKit

class NotesReviewViewController: UIViewController {

    //MARK: - Outlets
    @IBOutlet weak var headerTextField: UITextField!
    @IBOutlet weak var noteTextView: UITextView!
    
    //MARK: - Properties
    
    var index : Int?
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Setup()
        setUpUI()
        rightButton()
        
    }
    
    
    //MARK: - Methods
    
    private func Setup(){
        headerTextField.attributedPlaceholder = NSAttributedString(string: "Header", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
        noteTextView.layer.borderWidth = 1
        noteTextView.layer.borderColor = CGColor.init(red: 250, green: 0, blue: 0, alpha: 1)
        noteTextView.layer.cornerRadius = 5
    }
    
    private func setUpUI(){
        guard let header = headerTextField.text,
              let note = noteTextView.text else {return}
        
        var newNote = Note(header: header, text: note)
        if let index = index{
            newNote = NoteDataSource.shared.notes[index]
        }
        headerTextField.text = newNote.header
        noteTextView.text = newNote.text
    }
    
    private func rightButton(){
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "pencil.tip.crop.circle.badge.plus"), style: .done, target: self, action: #selector(didTapAddButton))
    }
    
    @objc func didTapAddButton(){
        guard let header = headerTextField.text,
              let note = noteTextView.text else {return}
        var newContent = Note(header: header, text: note)
        if let index = index{
            newContent = NoteDataSource.shared.notes[index]
        }else{
            NoteDataSource.shared.notes.append(newContent)
        }
        
         
        }
        
    }
    
 


