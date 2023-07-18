//
//  SceneDelegate.swift
//  Navigation
//
//  Created by Evgeny Savin on 11.03.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: scene)
        
        // Покраска статус бара в белый цвет (без этой настройки статус бар был серым) 
        
        let customNavBarAppearance = UINavigationBarAppearance()
        customNavBarAppearance.configureWithOpaqueBackground()
        customNavBarAppearance.backgroundColor = .white
        
        let appearance = UINavigationBar.appearance()
        appearance.scrollEdgeAppearance = customNavBarAppearance
        appearance.compactAppearance = customNavBarAppearance
        appearance.standardAppearance = customNavBarAppearance
        
        // Создаю экземпляры классов viewController для дальнейшего использования в коде

        let loginViewController = LogInViewController()
        loginViewController.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person.fill"), tag: 0)
        
        let feedViewController = FeedViewController()
        feedViewController.tabBarItem = UITabBarItem(title: "Feed", image: UIImage(systemName: "house"), tag: 1)
       
        //Создаю экземпляры навигационных контроллеров и передаю рутовое значения (первый экран) для того, чтобы использовать их в тапбаре.
        
        let profileNavigationController = UINavigationController(rootViewController: loginViewController)
        profileNavigationController.navigationBar.isHidden = true
        
        let feedNavigationViewController = UINavigationController(rootViewController: feedViewController)
        
        // Создаю таб-бар контроллер
        
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [feedNavigationViewController, profileNavigationController]
        UITabBar.appearance().backgroundColor = .white
        
        window.rootViewController = tabBarController
        window.makeKeyAndVisible()
        
        self.window = window
        
        
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

