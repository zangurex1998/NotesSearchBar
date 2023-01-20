//
//  NotesViewController.swift
//  NotesSearchBar
//
//  Created by technomix on 16.01.23.
//

import UIKit

class NotesViewController: UIViewController {
    
    //MARK: - Outlets
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    //MARK: - Properties
    
    let searchController = UISearchController()
    var note = NoteDataSource.shared.notes
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        NotificationListener()
    }
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpSearchController()
        setUpCollectionView()
        plusButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView.reloadData()
      
    }
        
   
    
    deinit {
        clearObserver()
    }
    //MARK: - Methods
    
    private func NotificationListener(){
        NotificationCenter.default.addObserver(self, selector: #selector(shouldListen), name: .name, object: nil)
    }
    
    @objc func shouldListen(notification : Notification){
        guard let userName = notification.userInfo?["user"] else {return}
        navigationItem.title = "\(userName)'s Notes"
    }
    private func clearObserver(){
        NotificationCenter.default.removeObserver(self)
    }
    
    private func setUpCollectionView(){
       
        collectionView.backgroundColor = .black
        self.note = NoteDataSource.shared.notes
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(NoteCollectionViewCell.self, forCellWithReuseIdentifier: "NoteCollectionViewCell")
    }
    private func setUpSearchController(){
        navigationItem.searchController = searchController
        searchController.searchResultsUpdater = self
    }
    
    //MARK: - Button
    
    private func plusButton(){
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "folder.fill.badge.plus"), style: .plain, target: self, action: #selector(didTapPlusButton))
    }
    
    @objc func didTapPlusButton(){
        let vc = UIStoryboard(name: "ReviewNote", bundle: nil).instantiateViewController(withIdentifier: "review")
        navigationController?.pushViewController(vc, animated: true)
    }
    

}
//MARK: - CollectionView Extensions

extension NotesViewController : UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = UIStoryboard(name: "ReviewNote", bundle: nil).instantiateViewController(withIdentifier: "review") as! NotesReviewViewController
        vc.index = indexPath.row
        navigationController?.pushViewController(vc,
                                                 animated: true)
    }
}
extension NotesViewController : UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        NoteDataSource.shared.notes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NoteCollectionViewCell", for: indexPath) as! NoteCollectionViewCell
        cell.configure(with: NoteDataSource.shared.notes[indexPath.row])
        return cell
    }
    
    
}
extension NotesViewController : UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width : CGFloat = view.frame.width / 4
        let height : CGFloat = view.frame.width / 4
        return CGSize(width: width, height: height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        3
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 5, left: 10, bottom: 0, right: 10)
    }
}

//MARK: - SearchController Extension
extension NotesViewController : UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else {return}
        if text.isEmpty{
            setUpCollectionView()
        }else{
            self.note = NoteDataSource.shared.notes.filter{$0.header.lowercased().contains(text.lowercased())}
        }
        self.collectionView.reloadData()
    }
    
    
}

