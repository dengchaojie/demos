import Combine
import Foundation
/*:
[Previous](@previous)
## Publishers and Subscribers
- A Publisher _publishes_ values ...
- .. a subscriber _subscribes_ to receive publisher's values

*/
//参考https://www.jianshu.com/p/df8535b40079 https://github.com/AvdLee/CombineSwiftPlayground

let publ = Just(28)
let cancelHrt = publ.sink(receiveValue: { value in
    
    print(value)
})
cancelHrt.cancel()

let cancelHrt2 = publ.sink(receiveCompletion: {
    print("receiveCompletion: \($0)")

}, receiveValue: {
    print("receiveValue: \($0)")

})
cancelHrt2.cancel()

//class Person {
//    var name: String
//    init(name: String) {
//        self.name = name
//    }
//}
//
//let per = Person.init(name: "dcj")

//Just and Subscribers.Sink
//let once: Just = Just(100)
//let observer: Subscribers.Sink<Int,Never> = Subscribers.Sink(receiveCompletion: {
//    print("completed: \($0)")
//}, receiveValue: {
//    print("received value: \($0)")
//})
//once.subscribe(observer)

//Subscribers.Assign and PassthroughSubject
//class Student {
//    let name: String
//    var score: Int
//
//    init(name:String, score:Int) {
//        self.name = name
//        self.score = score
//    }
//}
//
//let stu = Student.init(name: "dcj", score: 90)
//print(stu.score)
//let obs = Subscribers.Assign(object: stu, keyPath: \.score)
//let publisher = PassthroughSubject<Int, Never>()
//publisher.subscribe(obs)
//publisher.send(38)
//print(stu.score)
//publisher.send(100)
//print(stu.score)

/// CurrentValueSubject
//let currentValue = CurrentValueSubject<Int, NSError>(1)
//currentValue.sink(receiveCompletion: {
//    print("11\($0)")
//}, receiveValue: {
//    print("22\($0)")
//})
//
//currentValue.value = 2
//currentValue.value = 3
//currentValue.send(4)
//currentValue.send(completion: Subscribers.Completion<NSError>.finished)
//currentValue.send(completion: Subscribers.Completion<NSError>.failure(
//    NSError.init(domain: "xxx.com", code: 500, userInfo: ["errorMsg":"error"])))
//currentValue.value = 5


///AnyPublisher、AnySubscriber、AnySubject
//let pub = Publishers.Sequence<[String], Never>(sequence: ["1","2"]).eraseToAnyPublisher()




