//
//  ITunesSearchViewController.swift
//  SwiftArchDemo
//
//  Created by Alexander Suhodolov on 10/04/2025
//

import UIKit
import AppFoundation

@MainActor
protocol ITunesSearchViewInput: AnyObject {
    func show(albums: [ArtistAlbum])
}

@MainActor
protocol ITunesSearchViewOutput: AnyObject {
    func viewDidLoad()
    func searchQueryUpdated(artistName: String)
}

final class ITunesSearchViewController: UITableViewController, ModuleHolderProtocol {
    static let identifier = "ITunesSearchViewController"
    static let albumCellIdentifier = "albumCellIdentifier"
    
    weak var presenter: ITunesSearchViewOutput?
    var retainedModuleElements = [AnyObject]()
    
    private var albums: [ArtistAlbum]?
    
// MARK: View Preparation
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareView()
        presenter?.viewDidLoad()
    }
    
    private func prepareView() {
        title = String(
            localized: "itunes.navigation.title",
            defaultValue: "iTunes Albums",
            bundle: Bundle.module)

    }
}


// MARK: - UITableViewDataSource

extension ITunesSearchViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return albums?.count ?? 0
    }
    
    override func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        guard let album = albums?[indexPath.row] else { return UITableViewCell() }
        
        let cell = tableView.dequeueReusableCell(
            withIdentifier: Self.albumCellIdentifier,
            for: indexPath)
        
        var content = UIListContentConfiguration.cell()
        content.text = album.albumName
        content.secondaryText = "\(album.artistName)"
        content.prefersSideBySideTextAndSecondaryText = false
        cell.contentConfiguration = content

        return cell
    }
}


//MARK: - ITunesSearchPresenterInput

extension ITunesSearchViewController: ITunesSearchViewInput {
    func show(albums: [ArtistAlbum]) {
        self.albums = albums
        tableView.reloadData()
    }
}


// MARK: - UISearchBarDelegate

extension ITunesSearchViewController: UISearchBarDelegate {
    func searchBar(
        _ searchBar: UISearchBar,
        textDidChange searchText: String
    ) {
        presenter?.searchQueryUpdated(artistName: searchText)
    }
}
