//
//  OnboardingPresenter.swift
//  FaceAnswer
//
//  Created by Berkay Unal on 25.01.2024.
//
//  This file was generated by the 🐍 VIPER generator
//

import Foundation

final class OnboardingPresenter {
    
    // MARK: - Private properties -

    private unowned let view: OnboardingViewInterface
    private let interactor: OnboardingInteractorInterface
    private let wireframe: OnboardingWireframeInterface

    // MARK: - Lifecycle -

    init(view: OnboardingViewInterface, interactor: OnboardingInteractorInterface, wireframe: OnboardingWireframeInterface) {
        self.view = view
        self.interactor = interactor
        self.wireframe = wireframe
    }
}

// MARK: - Extensions -

extension OnboardingPresenter: OnboardingPresenterInterface {
}