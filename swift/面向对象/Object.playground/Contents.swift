import UIKit

//var str = "Hello, playground"

/**
 枚举
 1，OOP三大特征：封装、继承、多态。
 2，基本单元：枚举、结构体、类、协议、扩展。
 3，从整体功能上看，枚举、结构体、类三者具有平等的地位。
 4，都可以定义属性、方法、下标、构造体、嵌套类型。
 5，枚举和结构是值类型的，类是引用类型的。
 6，类和结构体的相似点：
 （1），定义属性存储值。
 （2），定义方法用于提供功能。
 （3），定义下标脚本用来允许使用下标语法访问值。
 （4），定义初始化器用于初始化状态。
 （5），可以被扩展来默认所没有的功能。
 （6），遵循协议来针对特定类型提供标准功能。
 7，类和结构体不同点：
 （1），继承允许一个类继承另一个类的特征。
 （2），类型转换允许你在运行期检查和解释一个类实例的类型。
 （3），反初始化器允许一个类实例释放任何其所分配的资源。
 （4），引用计数允许不止一个对类实例的引用。
 结构体不具备以上特点。
 // 枚举
 8，可以使用switch语句来匹配每一个单独的枚举值。
 9，遵循caseIterable协议后，可以用allCases来遍历所有枚举。
 10，可以定义枚举类型的关联值，不同枚举关联值类型可以不同。
 11，枚举成员可以用相同类型的默认值预先填充（原始值）。
 12，使用Int和String作为枚举的类型时，可以不必显式的给每一个成员分配原始值，Swift会自动分配。
 13，递归枚举是拥有另一个枚举作为枚举成员关联值的枚举，需要在生命枚举前用indirect关键字修饰。
 // 结构体、类和枚举的属性
 14，存储属性可由var或let引入，结构体实例的常量属性和变量属性都不能修改。
 15，延迟存储属性的初始值是第一次使用时才会计算，使用lazy修饰，lazy不是线程安全的。
 16，计算属性不实际存储值，而是提供一个读取器和一个可选的设置器来间接得到和设置其属性值，set方法可以使用简写方式，使用newValue来获得传进来的参数。
 17，如果getter函数是一个单一表达式，可以省略掉return。
 18，如果一个计算属性只有读取器，没有设置器，是只读属性，不能通过点语法修改。
 19，计算属性必须使用var来修饰，let只能修饰常量属性。
 20，属性观察者，willSet会在该值被存储前调用，didSet会在该值被存储后调用。在willSet中设置新参数名字，不设置默认newValue，didSet中一个包含旧属性值的参数值将会被传递，可以自己命名参数值，也是使用默认参数值oldValue。
 21，全局属性也可以设置属性观察者。
 // 添加方法
 22，实例方法是属于特定类实例、结构体实例或者枚举实例的函数。
 23，每个类的实力都隐含者一个self的属性，和实例本身相等。
 24，在结构体和枚举中需要修改属性的方法要用mutating关键字修饰，mutating方法可以指定整个实例给隐含的self属性。
 25，类型方法由staitic关键字修饰。
 26，在func前添加class关键字，继承的子类可以重写这个方法。
 // 下标
 27，类、结构体和枚举都可以定义下标，它可以作为访问集合或序列成员元素的快捷方式。
 28，下标脚本允许你通过在实例名后面的方括号内写一个或多个值对该类的实例进行查询，其语法类似于实例方法和计算属性。
 29，使用关键字subscript来定义下标，并且指定一个或多个输入形式参数和返回类型，与实例方法一样，下标可以是读写，也可以是只读。
 30，下标可以是任何类型。
 31，类型下标可以通过在subscript前使用static关键字修饰来实现，在类里边用class修饰允许子类重写父类的下标实现。
 // 类的初始化和反初始化
 32，类初始化器在创建特定类型时会被调用。
 33，Swift为所有没有提供初始化器的结构体或类提供了一个默认的初始化器来给所有的属性提供了默认值。
 34，可以提供初始化参数作为初始化器的一部分，来定义初始化过程中的类型和值的名称。
 35，在初始化任意时刻，都可以给常量属性赋值，只要它在初始化结束是设置了确定的值即可。
 36，如果结构体类型没有定义任何自定义初始化器，它会自动获得一个成员初始化器。
 39，初始化器可以调用其他初始化器来执行不分实例的初始化。这个过程，就是所谓的初始化器委托，避免了多个初始化器中的冗余代码。
 // 类的继承和初始化
 40，所有类的存储属性(包括从它的父类继承的所有属性）都必须在初始化期间分配初始值。
 41，Swift为类类型定义了两种初始化器以确保所有的存储属性接收一个初始值。这些就是所谓的指定初始化器和便捷初始化器。
 42，指定初始化器是类的主要初始化器。指定的初始化器可以初始化所有那个类引用的属性并且调用合适的父类初始化器来继续这个初始化过程给父类链。
 43，类偏向于少量指定初始化器，并且一个类通常只有一个指定初始化器。指定初始化器是初始化开始并持续初始化过程到父类链的“传送点”。
 44，每个类至少得有一个指定初始化器。如同在初始化器的自动继承里描述的那样，在某些情况下，这些需求通过父类继承一个或多个指定初始化器来满足。
 45，便捷初始化器是次要的。你可以在相同的类里定义一个便捷初始化器来调用一个指定的初始化器做为便捷初始化器来给指定初始化器设置默认形式参数。你也可以为具体的使用情况或输入的值类型定义一个便捷初始化器从而创建这个类的实例。
 46，如果你的类不需要便捷初始化器你可以不提供它。在为通用的初始化模式创建快捷方式以节省时间或者类类的初始化更加清晰明了的时候使用便捷初始化器。
 47，指定初始化器和便捷初始化器的区别就是便捷初始化器前要加convenience关键字修饰。
 48，指定初始化器必须从它的直系父类调用指定初始化器。
 49，便携初始化器必须从相同的类里调用另一个初始化器。
 50，便捷初始化器最终必须调用一个指定初始化器。
 // 安全检查
 51，指定初始化器必须保证在向上委托给父类初始化器之前，其所在类引入的所有属性都要初始化完成。
 52，指定初始化器必须向上委托父类初始化器，然后才能为继承的属性设置新值。如果不这样做，指定初始化器赋予的新值将被父类中的初始化器覆盖。
 53，便捷初始化器必须先委托同类中的其他初始化器，然后再为任意属性赋新值（包括同类里定义的属性）。如果没这么做，便携初始化器赋予的新值将被自己类中其他初始化器所覆盖。
 54，初始化器在第一阶段初始化完成之前，不能调用任何实例方法、不能读取任何实例属性的值，也不能引用self作为值。
 // 两段式初始化过程-阶段1
 55，指定或便携初始化器在类中被调用。
 56，为这个类的新实例分配内存。内存还没有被初始化。
 57，这个类的指定初始化器确保所有由此类引入的存储属性都有一个值。现在这些存储属性的内存被初始化了。
 58，指定初始化器上交父类的初始化器为其存储属性执行相同的任务。
 59，这个调用父类初始化器的过程将沿着初始化器链一直向上进行，直到到达初始化器链的最顶部。
 60，一旦到达初始化链的最顶部，在链顶部的类确保所有的存储属性都一个值，此实例的内存被认为完全初始化了，此时第一阶段完成。
 // 两段式初始化过程-阶段2
 61，从顶部初始化器往下，链中的每一个初始化器都有机会进一步定制实例。初始化器现在能够访问self并切可以修改它的属性，调用它的实例方法等等。
 62，最终，链中任何便捷初始化器都有机会定制实例以及使用self。
 // 初始化器的继承和重写
 63，不像在Objective-C中的子类，Swift子类不会默认继承父类的初始化器。Swift的这种机制防止父类的简单初始化器被一个更专用的子类继承并被用来创建一个没有完全或错误初始化的新实例的情况发生。只有在特定的情况下才会继承父类的初始化器。
 64，如果你想自定义子类来实现一个或多个和父类相同的初始化器，你可以在子类中为那些初始化器提供定制的实现。
 65，当你写的子类初始化器匹配父类制定初始化器的时候，你实际上可以重写那个初始化器。因此，在子类的初始化器定义前你必须写overide修饰符。如同默认初始化器所描述的那样，即使是自动提供的默认初始化器你也可以重写。
 // 初始化器的自动继承
 66，如果你的子类没有定义任何指定初始化器，它会自动继承父类所有的指定初始化器。
 67，如果你的子类提供了所有父类指定初始化器的实现--要么是通过规则1继承来的，要么通过在定义中提供自定义实现的，那么它自动继承所有的父类便捷初始化器。
 // 可失败初始化器
 68，定义类、结构体或枚举初始化时可以失败在某些情况下会管大用。这个失败可能由以下几种方式触发，包括给初始化传入无效的形式参数值，或缺少某种外部所需的资源，又或是其他阻止初始化的情况。
 69，为了妥善处理这种可能失败的情况，在类、结构体或枚举中定义一个或多个可失败的初始化器。通过在init关键字后面添加问号（init?）来写。
 // 必要初始化器
 70，在类的初始化器前添加required修饰符来表明所有该类的子类都必须实现该初始化器。
 // 反初始化
 71，在类实例被释放的时候，反初始化器就会立即被调用。你可以是用deinit关键字来写反初始化器，就如同写初始化器需要用init关键字一样。反初始化器只在类类型中有效。
 72，反初始化器会在实例被释放前自动被调用。你不能自行调用反初始化器。父类的反初始化器可以被子类继承，并且子类的反初始化器实现结束后父类的反初始化器会被调用。父类的反初始化器总会被调用，就算子类没有反初始化器。
 // 继承
 // 定义基类
 73，任何不从另一个类继承的类都是所谓的基类。
 74，Swift类不会从一个通用基类继承。你没有指定特定父类的类都会以基类形式创建。
 // 子类
 75，子类是基于现有类创建新类的行为。子类从现有类继承了一些特征，你可以重新定义它们。你也可以为子类添加新的特征。
 76，子类写在父类前，并用冒号隔开。
 // 重写
 77，子类可以提供自己的实例方法、类型方法、实例属性，类型属性或下标脚本的自定义实现，否则它将从会从父类继承。这就是所谓的重写。
 78，要重写而不是继承一个特征，你需要在你的重写定义前面加上override关键字。这样做说明你打算提供一个重写而不是意外提供一个相同定义。意外的重写可能导致意想不到的行为，并且任何没有使用overide关键字的重写都会在编译时被诊断为错误。
 // 访问父类的方法、属性和小标脚本
 79，你可以通过使用super前缀访问父类的方法、属性和下标脚本。
 80，一个命名为someMethod()的重写方法可以通过super.someMethod()在重写方法的实现中调用父类版本的someMethod()方法。
 81，一个命名为someProperty的重写属性可以通过super.someProperty在重写的getter和setter实现中访问父类版本的someProperty实现。
 82，一个命名为someIndex的重写下标脚本可以使用super[someIndex]在重写的下标脚本实现中访问父类版本中相同的下标脚本。
 // 重写属性的getter和setter
 83，可以提供一个自定义的getter（和setter，如果合适的话）来重写任意继承的属性，无论在最开始继承的属性实现为存储属性还是计算属性。
 // 重写属性的观察器
 84，可以使用属性重写来为继承的属性添加属性观察器。这就可以让你在继承属性的值改变时得到通知，无论最初这个属性如何实现。
 85，不能给继承而来的常量存储属性或者只读的计算属性添加属性观察器。这些属性的值不能被设置，所以提供willSet或didSet实现作为重写的一部分也是不合适的。
 86，不能为同一属性同时提供重写的setter和重写的属性观察器。如果你想要监听属性值的改变，并且你已经为那个属性提供了一个自定义的setter，那么你从自定义的setter里就可以监听任意值的变化。
 // 阻止重写
 87，可以通过标记为final来阻止一个方法、属性或下标脚本被重写。通过在方法、属性或者下标脚本的关键字前写final修饰符（比如final var、final func，final class func，final subscript)
 // 多态，类型转换
 88，使用类型检查符（is）来检查一个实例是否属于一个特定的子类。如果实例是该子类类型，类型检查操作符返回true，否则返回false。
 // 向下类型转换
 89，某个类型的常量或变量可能实际上在后台引用自一个子类的实例。当遇到这种情况时你可以尝试使用类型转换操作符（as?或as!）将它们向下类型转换为子类型。
 // Any和AnyObject
 90，Swift为不确定的类型提供了两种特殊的类型型名：
 AnyObject可以表示任何类型的实力。
 Any可以表示任何类型，包括函数类型。
 // 嵌套类型
 91，Swift的类、结构体和枚举可以进行嵌套，即在某一类型的内部定义类型。
 92，嵌套类型能够访问它外部的成员。
 // extension
 93，扩展为现有的类、结构体、枚举类型、或协议添加了功能。这也包括了为无访问权限的源代码扩展类型的能力（即所谓的逆向建模）。
 94，扩展和Ojective-C中的category类似。（与Ojective-C的分类不同的是，Swift的扩展没有名字）
 // extension能力
 95，添加计算实例属性和计算类型属性。
 96，定义实例方法和类型方法。
 97，提供新初始化器。
 98，定义下标。
 99，定义和使用新内嵌类型。
 100，使现有的类型遵循某协议。
 101，扩展可以向一个类型添加新的方法，但是不能重写原有方法。
 // 初始化器
 102，扩展可向现有的类型添加新的初始化器。这允许你扩展其他类型以使初始化器接收你的自定义类型作为形式参数，或提供该类型的原始实现中未包含的额外初始化选项。
 103，扩展可为类添加新的便捷初始化器。但不能为类添加指定初始化器或反初始化器。指定初始化器和反初始化器必须由原来类的实现提供。
 // mutating
 104，扩展的实例方法仍可以修改（或异变）实例本身。结构体或枚举类型方法在修改self或本身的属性时必须标记实例方法为mutating，和原本实现的异变方法一样。
 // 下标
 105，扩展可以为已有的类型添加新的下标。
 // 添加内嵌类型
 106，扩展可以为已有的类、结构体和枚举类型添加新的内嵌类型。
 // 协议的语法
 107，自定义类型声明时，将协议名放在类型名的冒号之后来表示该协议采纳一个特定的协议。多个协议可以用逗号分开列出。
 108，若一个类拥有父类，将这个父类名放在其采纳的协议名之前，并用逗号分隔。
 // 属性要求
 109，协议可以要求所有遵循该协议的类型提供特定名字和类型的实力属性或类型属性。协议并不会具体说明属性是存储属性还是计算型属性--它只具体要求属性有特定的名称和类型。协议同时要求一个属性明确是可读的或可读和可写的。
 110，若协议要求一个属性为可读和可写的，那么该属性要求不能用常量存储属性或只读计算属性来满足。
 111，在协议中定义类型属性时要在前边添加static关键字。当类的实现使用class或static关键字前缀声明类型属性要求时，以上规则仍适用。
 // 方法要求
 112，协议可以要求采纳的类型实现制定的实例方法和类方法。这些方法做为协议定义的一部分，书写方式与正常实例和类方法的方式完全相同，但是不需要大括号和方法的主体。允许拥有参数，与正常的方法使用同样的规则。但在协议的定义中，方法参数不能定义默认值。
 113，正如类型属性要求的那样，当协议中定义属性方法时也要使用static关键字修饰，在类实现也同样需要添加static前缀。
 // mutating方法要求
 114，使用mutating关键字可以定义可异变实例的协议方法以供结构体和枚举类型使用。
 // 初始化器要求
 115，协议可以要求遵循协议的类型实现指定的初始化器。和一般初始化器一样，只用将初始化器写在协议的定义中，但不用实体实现。
 // 初始化器要求的类实现
 116，你可以通过实现指定初始化器或便携初始化器来使遵循该协议的类满足协议的初始化器要求。
 117，如果一个子类重写了父类指定的初始化器，并且遵循协议实现了初始化器要求，那么就要为这个初始化器的实现添加required和overide两个修饰符。
 // 将协议作为类型
 118，协议可以做函数、方法或初始化器的形式参数或返回类型。
 119，协议可以做常量、变量或属性的类型。
 120，协议可以作为数组、字典或其他存储器的元素的类型。
 // 协议继承
 121，协议可以继承一个或多个其他协议。
 // 类专用的协议
 122，通过添加AnyObject关键字到协议的继承列表，你就可以限制协议只能被类类型采纳（而不能被结构体或枚举类型采纳）。
 // 协议组合
 123，可以使用协议组合来符合多个协议到一个要求里。
 124，协议组合使用&连接，如SomeProtocol&AnyotherProtocol。
 // 可选协议要求
 125，可以给协议定义可选要求，这些要求不需要强制遵循协议的类型实现。可选要求使用optional修饰符作为前缀房子协议的定义中。可选要求允许你的代码与Objective-C操作。协议和可选要求必须使用@objc标志标记。注意@objc协议只能被继承自Objective-C类或其他@objc类采纳。它们不能被结构体或者媒体采纳。
 // 在扩展里添加协议遵循
 126，可以扩展一个已经存在的类型来采纳和遵循一个新的协议，就算是无法访问源代码也可。
 // 有条件地遵循协议
 127，泛型类型可能只在某些情况下满足一个协议的要求，比如当类型的泛型形式参数遵循对应协议时，可以通过在扩展类型时列出限制让泛型类型有条件地遵循协议。在采纳的名字后面写泛型where分句。
 // 协议扩展
 128，协议可以通过扩展来提供方法和属性的实现以遵循类型。这就允许你在协议自身定义行为，而不是在每一个遵循或者全局函数里定义。
 // 提供默认实现
 129，你可以使用协议扩展来给协议任意方法或者计算属性要求提供默认实现。
 // OOP缺陷
 130，需要一开始就设计好架构，重构复杂，继承机制可能会带来一些问题，在一些条件下值类型由于对象类型。
 // POP
 131，
 
*/

//遵守CaseIterable协议后可以遍历
//enum CompassPoint:CaseIterable {
//    case south
//    case north
//    case east
//    case west
//}
//
//let direction = CompassPoint.west
//switch direction {
//case .south:
//    print("south")
//case .north:
//    print("north")
//case .east:
//    print("east")
//case .west:
//    print("west")
//}
//
//print(CompassPoint.allCases.count)
//print(CompassPoint.allCases)

// 预设值
//enum ControlCharactor:String {
//    case tab = "\t"
//    case line = "\n"
//}
//print(ControlCharactor.tab)
//print(ControlCharactor.tab.rawValue)
//print("begin\(ControlCharactor.tab.rawValue)end")
//print("begin\(ControlCharactor.line.rawValue)end")

//enum CompassPoint:Int {
//    case south = 5
//    case north
//    case east
//    case west
//}
//print(CompassPoint.north.rawValue)
//let direction = CompassPoint(rawValue: 8)
//print(direction)

//enum Planet: String {
//    case earth
//    case mars = "Mars"
//    case Venus
//}
//print(Planet.mars)
//print(Planet.mars.rawValue)
//print(Planet.earth)
//print(Planet.earth.rawValue)

// 关联值
//enum Barcode {
//    case upc(Int, Int, Int, Int)
//    case quCode(String)
//}
//var productCode = Barcode.upc(1, 2, 3, 4)
//print(productCode)
//productCode = .quCode("abcd")
//
//switch productCode {
//case .upc(let a, let b, let c, let d):
//    print("upc-\(a)-\(b)-\(c)-\(d)")
//case .quCode(let codeString):
//    print("qrcode=\(codeString)")
//}

//// 递归枚举
//indirect enum ArithmetricExPression {
//    case number(Int)
//    case add(ArithmetricExPression, ArithmetricExPression)
//    case mutiply(ArithmetricExPression, ArithmetricExPression)
//}
//
//let firstExpression = ArithmetricExPression.number(5)
//let secondExpression = ArithmetricExPression.number(4)
//let addExpression = ArithmetricExPression.add(firstExpression, secondExpression)
//let third = ArithmetricExPression.number(2)
//let mutiplyExpression = ArithmetricExPression.mutiply(addExpression, third)
//print(mutiplyExpression)
//
//func eval(_ expression:ArithmetricExPression) -> Int {
//    switch expression {
//    case .number(let value):
//        return value
//    case .add(let first, let second):
//        return eval(first) + eval(second)
//    case .mutiply(let first, let second):
//        return eval(first) * eval(second)
//    }
//}
//print(eval(mutiplyExpression))

/**
 添加属性
 */

// 存储属性和计算属性
//struct Point {
//    var x = 0
//    var y = 0
//
//}
//
//struct Size {
//    var width = 0
//    var height = 0
//}
//
//struct React {
//    var origin:Point
//    var size:Size
//    var Center:Point {
//        get {
//            //return Point(x: origin.x + size.width / 2, y: origin.y + size.height / 2)
//            // 可以简写省掉return
//            Point(x: origin.x + size.width / 2, y: origin.y + size.height / 2)
//        }
//        set(newCenter) { // 可以简写省略newCenter，使用默认值newValue
//            origin.x = newCenter.x - size.width / 2
//            origin.y = newCenter.y - size.height / 2
//        }
//    }
//}

// 属性观察器
//class StepCounter {
//    var totalSteps:Int = 0 {
//        willSet(newSteps) {// 可以简写省略newSteps，使用默认值newValue
//            print("will set totalSteps to \(newSteps)")
//        }
//        didSet(oldSteps) {// 可以简写省略oldSteps，使用默认值oldValue
//            print("did change totalSteps from \(oldSteps) to \(totalSteps)")
//        }
//    }
//}
//var counter = StepCounter()
//counter.totalSteps = 100
//counter.totalSteps = 360
//counter.totalSteps = 812

// 全局属性添加观察者
//var count:Int = 0 {
//    willSet {
//        print("will set count to \(newValue)")
//    }
//    didSet {
//        print("did set count from \(oldValue) to \(count)")
//    }
//}
//count = 10

/**
 添加方法
 */

//struct Point {
//    var x = 0
//    var y = 0
//    // 值类型的属性在成员方法中改变要加mutating关键词
//    mutating func moveBy(x:Int, y:Int) {
//        //self.x += x
//        //self.y += y
//        // mutating方法可以指定整个实例给隐含的self属性
//        self = Point(x: self.x + x, y: self.y + y)
//    }
//    func printInfo() {
//        print("x is \(x), y is \(y)")
//    }
//    // 类的静态方法
//    static func printTypeInfo() {
//        print("A point")
//    }
//}
//
//var p = Point(x: 2, y: 2)
//p.printInfo()
//Point.printTypeInfo()
//p.moveBy(x: 2, y: 5)
//p.printInfo()

/**
 下标和下标重载
 */

//struct Matrix {
//    let rows:Int
//    let columns:Int
//    var grid:[Double]
//    init(rows:Int, columns:Int) {
//        self.rows = rows
//        self.columns = columns
//        grid = Array(repeating: 0.0, count: rows * columns)
//    }
//    subscript(row:Int, column:Int) -> Double {
//        get {
//            return grid[row * columns + column]
//        }
//        set {
//            grid[row * columns + column] = newValue
//        }
//    }
//}
//
//var matrix = Matrix(rows: 2, columns: 2)
//matrix[1, 0] = 9.9
//matrix[0, 1] = 8.8
//print(matrix.grid)
//print(matrix[0, 1])

//enum CompassPoint:Int {
//    case south = 1
//    case north
//    case east
//    case west
//
//    static subscript(index:Int) -> CompassPoint {
//        get {
//            return CompassPoint(rawValue: index)!
//        }
//    }
//}
//
//let direction = CompassPoint[2]
//print(direction)

/**
 类的初始化和反初始化
 */

//class Person {
//    var name:String
//    var age:Int
//
//    // 指定初始化器
//    init(name:String, age:Int) {
//        self.name = name
//        self.age = age
//    }
//
//    // 必要初始化器
////    required init(name:String, age:Int) {
////        self.name = name
////        self.age = age
////    }
//
//    // 可失败初始化器
////    init?(name:String, age:Int) {
////        if age > 200 {
////            return nil
////        }
////        self.name = name
////        self.age = age
////    }
//
//    // 便携初始化器
//    convenience init() {
//        // 便携构造器调用指定构造器完成构造
//        self.init(name:"[Unnamed]", age:0)
//    }
//}

// 测试可失败构造器
//let person = Person(name: "zhangsan", age: 300)
//print(person)

//class Teacher:Person {
//    var salary:Int
//
////    override init(name: String, age: Int) {
////        self.salary = 5000
////        super.init(name: name, age: age)
////    }
//
//    init(name: String, age: Int, salary:Int) {
//        self.salary = salary // 子类存储属性要在super.init之前调用
//        //self.name = self.name + "老师"//报错
//        //self.test()//报错
//        super.init(name: name, age: age)
//        self.test() // 需要在super.init之后调用
//        //self.salary = salary//报错
//        self.name = self.name + "老师" // 继承的属性要在super.init之后调用
//    }
//
//    func test() {
//        print("teacher test")
//    }
//
//    convenience init(salary:Int, age: Int) {
//        //self.salary = salary //报错
//        self.init(name:"zhangsan", age:age, salary:salary)
//        self.salary = salary + 1000 // 便捷初始化器需要在调用指定初始化器之后才能为自己属性赋值
//    }
//
////    required init(name: String, age: Int) {
////        fatalError("init(name:age:) has not been implemented")
////    }
//}

//let teacher = Teacher(salary: 2000, age: 23)
//teacher.test()


/**
 继承
 */

//class Vehicle {
//    var currentSpeed:Int = 0
//    //final var desc:String {//不能被子类继承这个方法
//    var desc:String {
//        return "run at speed \(currentSpeed)"
//    }
//    func makeNoise() {
//
//    }
//}
//
//class Car:Vehicle {
//    var gear:Int = 0
//    override var desc: String {
//        return super.desc + " at gear \(gear)"
//    }
//}
//
//var car = Car()
//car.gear = 3
//car.currentSpeed = 30
//print(car.desc)


/**
 多态 类型转换
 */

//class MediaItem {
//    var name:String
//    init(name:String) {
//        self.name = name
//    }
//}
//
//class Movie:MediaItem {
//    var director:String
//    init(name:String, director:String) {
//        self.director = director
//        super.init(name: name)
//    }
//}
//
//class Song:MediaItem {
//    var artist:String
//    init(name:String, artist:String) {
//        self.artist = artist
//        super.init(name: name)
//    }
//}
//
//let array = [Movie(name: "1", director: "2"), Song(name: "3,", artist: "4"), Movie(name: "5", director: "6")]
//print(type(of: array))
//for item in array {
//    if let realItem = item as? Movie {
//        print(realItem.director)
//    }
//}

/**
 扩展
 */
// 扩展计算属性
//extension Double {
//    var km:Double {
//        return self / 1000.0
//    }
//}
//
//let speed:Double = 1200.0
//print(speed.km)

// 扩展成员方法
//extension Int {
//    func repeatTask(task:() -> ()) {
//        for _ in 0..<self {
//            task()
//        }
//    }
//}
//
//3.repeatTask {
//    print("hello")
//}

// 扩展下标
//extension Int {
//    subscript(digitIndex: Int) -> Int {
//        get {
//            var base = 1
//            for _ in 0..<digitIndex {
//                base *= 10
//            }
//            return (self / base % 10) // 返回digitIndex位数字
//        }
//    }
//}
//
//print(56667[3])

// 扩展嵌套类型
//extension Int {
//    enum Kind {
//        case zero
//        case negative
//        case positive
//    }
//    var kind:Kind {
//        get {
//            switch self {
//            case 0:
//                return .zero
//            case let x where x > 0:
//                return .positive
//            default:
//                return .negative
//            }
//        }
//    }
//}
//
//print(0.kind)
//print(8.kind)
//print((-1).kind)


/**
 协议
 */

//var str = "Hello, playground"
//
//protocol Named {
//    var name:String {
//        get
//    }
//}
//
//protocol Aged {
//    var age:Int {
//        get
//    }
//
//}
//
//struct Person:Named, Aged {
//    var name: String
//    var age: Int
//}
//
//let p = Person(name: "zhangsan", age: 20)
//
//func wish(to:Named & Aged) {
//    print("name \(to.name) age \(to.age)")
//}
//
//wish(to: p)

// 协议 + 扩展

//struct Person {
//    var name: String
//    var age: Int
//}
//let p = Person(name: "zhangsan", age: 20)

//protocol TextRepresentable {
//    var desc:String {
//        get
//    }
//}
//extension Person:TextRepresentable {
//    var desc: String {
//        return "name \(name) age \(age)"
//    }
//}
//print(p.desc)

//extension Array:TextRepresentable where Element: TextRepresentable {
//    var desc: String {
//        let itemDesc = self.map{$0.desc}
//        return itemDesc.joined(separator: ",")
//    }
//}
//
//let array = [Person(name: "zhangsan", age: 20), Person(name: "lisi", age: 30)]
//print(array.desc)
////let intArray = [1, 2, 3]
////print(intArray.desc)//报错
//
//extension Int: TextRepresentable {
//    var desc: String {
//        return String(self)
//    }
//}
//
//let intArray = [1, 2, 3]
//print(intArray.desc)

/**
 POP
 */

protocol Human {
    var name: String {get set}
    var age: Int  {get set}
    func sayHi()
}

protocol Runable {
    func run()
}

protocol Swimming {
    func swim()
}

struct Runner: Human, Runable {
    var name: String
    var age: Int
    func sayHi() {
        print("Hi, I'm \(name)")
    }
    func run() {
        print("run")
    }
}

struct Swimmer: Human, Swimming {
    var name: String
    var age: Int
    func sayHi() {
        print("Hi, I'm \(name)")
    }
    func swim() {
        print("swim")
    }
}

struct AllAroundAthlete: Human, Runable, Swimming {
    var name: String
    var age: Int
    func sayHi() {
        print("Hi, I'm \(name)")
    }
    func run() {
        print("run")
    }
    func swim() {
        print("swim")
    }
}

print("end")
