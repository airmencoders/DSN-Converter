//
//  OnBoardViewController.swift
//  DSN Converter
//
//  Created by https://github.com/Ramotion/paper-onboarding

import UIKit

import paper_onboarding
class OnBoardViewController: UIViewController {
    
    @IBOutlet var skipButton: UIButton!
    
    fileprivate let items = [
        OnboardingItemInfo(informationImage: #imageLiteral(resourceName: "OnBoardPhone"),
                           title: "DSN Converter",
                           description:"As military members, we use DSN phone numbers every day. Sometimes having access to the right conversion can be challenging. Especially for TDY or Deployed personnel which might not have access to the internet. If they do, the process of searching online for the correct conversion can be time consuming, which can lead to mission impact. With DSN converter, you can dial a DSN number right from your cell phone. Our algorithm will make the necessary conversion to a commercial phone number.",
                           pageIcon: #imageLiteral(resourceName: "phone-call-4"),
                           color: UIColor.systemBackground,
                           titleColor: UIColor.label, descriptionColor: UIColor.label, titleFont: titleFont, descriptionFont: descriptionFont),
        
    
        OnboardingItemInfo(informationImage: #imageLiteral(resourceName: "gdpr"),
                           title: "Disclaimer",
                           description: "DO NOT DISCUSS CLASSIFIED INFORMATION.\n\n Please be aware that DSN Converter uses your commercial cell service to make phone calls. Make sure not to discuss any classified information over an unsecured line.\n",
                           pageIcon: #imageLiteral(resourceName: "phone-call-4"),
                           color: UIColor.systemBackground,
                           titleColor: UIColor.label, descriptionColor: UIColor.label, titleFont: titleFont, descriptionFont: descriptionFont),
        OnboardingItemInfo(informationImage: #imageLiteral(resourceName: "gdpr"),
                           title: "Disclaimer",
                           description: "DO NOT DISCUSS CLASSIFIED INFORMATION.\n\n Please be aware that DSN Converter uses your commercial cell service to make phone calls. Make sure not to discuss any classified information over an unsecured line.\n",
                           pageIcon: #imageLiteral(resourceName: "phone-call-4"),
                           color: UIColor(red: 0.098, green: 0.2941, blue: 0.6275, alpha: 1.0),
                           titleColor: UIColor.white, descriptionColor: UIColor.white, titleFont: titleFont, descriptionFont: descriptionFont),
        
        ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        skipButton.isHidden = true
        
        setupPaperOnboardingView()
        
        view.bringSubviewToFront(skipButton)
    }
    
    private func setupPaperOnboardingView() {
        let onboarding = PaperOnboarding()
        onboarding.delegate = self
        onboarding.dataSource = self
        onboarding.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(onboarding)
        
        // Add constraints
        for attribute: NSLayoutConstraint.Attribute in [.left, .right, .top, .bottom] {
            let constraint = NSLayoutConstraint(item: onboarding,
                                                attribute: attribute,
                                                relatedBy: .equal,
                                                toItem: view,
                                                attribute: attribute,
                                                multiplier: 1,
                                                constant: 0)
            view.addConstraint(constraint)
        }
    }
    @IBAction func Skip(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
}

// MARK: Actions
extension OnBoardViewController {
    
    @IBAction func skipButtonTapped(_: UIButton) {
       performSegue(withIdentifier: "ChooseBranchSegue", sender: nil)
    }
}

// MARK: PaperOnboardingDelegate
extension OnBoardViewController: PaperOnboardingDelegate {
    
    func onboardingWillTransitonToIndex(_ index: Int) {
        skipButton.isHidden = index == 2 ? false : true
        
        if index == 1 {
            performSegue(withIdentifier: "ChooseBranchSegue", sender: nil)
            
        }
        
    }
    
    func onboardingDidTransitonToIndex(_: Int) {
    }
    
    func onboardingConfigurationItem(_ item: OnboardingContentViewItem, index: Int) {
        //item.titleLabel?.backgroundColor = .redColor()
        //item.descriptionLabel?.backgroundColor = .redColor()
        //item.imageView = ...
    }
}

// MARK: PaperOnboardingDataSource
extension OnBoardViewController: PaperOnboardingDataSource {
    
    func onboardingItem(at index: Int) -> OnboardingItemInfo {
        return items[index]
    }
    
    func onboardingItemsCount() -> Int {
        return 3
    }
    
    //    func onboardinPageItemRadius() -> CGFloat {
    //        return 2
    //    }
    //
    //    func onboardingPageItemSelectedRadius() -> CGFloat {
    //        return 10
    //    }
    //    func onboardingPageItemColor(at index: Int) -> UIColor {
    //        return [UIColor.white, UIColor.red, UIColor.green][index]
    //    }
}


//MARK: Constants
extension OnBoardViewController {
    
    private static let titleFont = UIFont(name: "Nunito-Bold", size: 36.0) ?? UIFont.boldSystemFont(ofSize: 36.0)
    private static let descriptionFont = UIFont(name: "OpenSans-Regular", size: 14.0) ?? UIFont.systemFont(ofSize: 14.0)
}
