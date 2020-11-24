/*Lógica

Caminho - Extensions/String+Extensions

// Para realizar a busca das palavras de acordo com as letras digitadas:
1 - Foi criado um método de extensão na classe String, onde ela é responsável por verificar se todas as letras de uma string estão contidas dentro de outra string fornecida.
2 - Será retornado uma tupla, com um valor booleano informando se contém todas as letras e um array de strings com as letras que sobraram.
3 - O algoritmo consiste em realizar um loop enquanto o número de letras da primeira palavra for menor que o número da segunda ou a primeira palavra se torne vazia, pois assim eu garanto que ainda é possível encontrar todas as letras ou que a palavra foi encontrada.
4 - A cada iteração é removida uma letra da segunda palavra e é verificado se ela existe na primeira palavra, em caso de sucesso, a letra é removida da primeira palavra, senão ela é inserida do array de letras que estão sobrando.
5 - É verificado se a primeira palavra está vazia, pois caso ela se torne vazia, a palavra está contida na segunda.
6 - Ao final é inserido as letras da segunda da palavra no array de letras que sobraram, pois há possibilidade de encontrar a palavra sem percorrer o segundo array todo.
 
 Caminho - Services/GameServices
 
 1 - Caso seja retornado alguma palavra, seus pontos serão calculados
 2 - Define como a melhor resposta até momento
 3 - Após percorrer todas as palavras disponíves, é retornado a melhor resposta ou nil caso não encontrar nenhuma.
 */

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}
