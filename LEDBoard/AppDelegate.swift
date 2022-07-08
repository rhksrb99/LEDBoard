//
//  AppDelegate.swift
//  LEDBoard
//
//  Created by 박관규 on 2022/07/06.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    // 13버전 이하에 대응을 하기위해선 AppDelegate에 한번 더 작성해줘야 한다.
    // var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        // 런치스크린에서 머무르게 할 수 있는 코드
        // 위험성 : 해당 부분에서 작성된 코드가 있을 땐 사용을 지양하는게 좋다.
        sleep(3)
        
        return true
    }
    
    // ios12까지의 앱 생명주기 설정
    func applicationDidEnterBackground(_ application: UIApplication) {
        // 멜론, 유튜브 -> 사용자가 프리미엄을 결제 했으면 background에서도 play, 아니라면 일시정지
        
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        // 유튜브 -> 결제하지않은 사용자에게 팝업창을 띄울 수 있는
        // 카카오톡 -> 백그라운드에서 다시 실행을 했을 때 잠금화면을 다시 띄울 수 있는
        // 금융 -> 백그라운드로 들어갔을 때 앱을 검은 화면 처리할 수 있는
    }
    

    // MARK: UISceneSession Lifecycle

    @available(iOS 13.0, *)
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    @available(iOS 13.0, *)
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

