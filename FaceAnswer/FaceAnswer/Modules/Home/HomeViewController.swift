//
//  HomeViewController.swift
//  FaceAnswer
//
//  Created by Berkay Unal on 25.01.2024.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

final class HomeViewController: UIViewController {

  @IBOutlet weak var howToPlayLabel: UILabel!
  @IBOutlet weak var textLabel: UILabel!
  @IBOutlet weak var collectionView: UICollectionView!
  // MARK: - Public properties -

  private var categoryNames: [String] = []
  var presenter: HomePresenterInterface!

  // MARK: - Lifecycle -

  override func viewDidLoad() {
    super.viewDidLoad()

    collectionView.dataSource = self
    collectionView.delegate = self
    collectionView.reloadData()
    setupUI()
    categoryNames.append(HomePresenter.galatasarayLegends.categoryName)
    categoryNames.append(HomePresenter.europeanCinema.categoryName)
  }

  private func setupUI() {
    title = "Face Answer"
    navigationController?.navigationBar.prefersLargeTitles = true
    howToPlayLabel.text = """
    Move your head to right ⇨ for giving TRUE answer to a sentence
    OR
    Move your head to left ⇦ for giving FALSE answer to a sentence.
    """
    textLabel.text = "Select a Category"
    collectionView.register(UINib(nibName: "CategoryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
  }
}

// MARK: - Extensions -

extension HomeViewController: HomeViewInterface {
}

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return categoryNames.count
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as? CategoryCollectionViewCell else { return UICollectionViewCell()}
    cell.configure(categoryName: categoryNames[indexPath.item].uppercased())
    return cell
  }

  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    if HomePresenter.galatasarayLegends.categoryName == categoryNames[indexPath.item] {
      presenter.pushData(HomePresenter.galatasarayLegends.galatasarayLegendsDict)
      presenter.shouldNavigateToQuestions(HomePresenter.galatasarayLegends.galatasarayLegendsDict)
    } else {
      presenter.pushData(HomePresenter.europeanCinema.europeanCinemaDict)
      presenter.shouldNavigateToQuestions(HomePresenter.europeanCinema.europeanCinemaDict)
    }
  }
}
