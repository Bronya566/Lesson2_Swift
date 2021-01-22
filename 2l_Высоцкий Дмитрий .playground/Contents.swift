import UIKit
import Foundation

///////////Задание 1. Написать функцию, которая определяет, четное число или нет.

func chetn(x: Int)-> Bool {
    return x % 2 == 0
}
print(chetn(x: 4))
print(chetn(x: 275))

/////////////Задание 2.  Написать функцию, которая определяет, делится ли число без остатка на 3
func del(y: Int)-> Bool {
    return y % 3 == 0
}
print(del(y: 3))
print(del(y: 275))

//////////////Задание 3. Создать возрастающий массив из 100 чисел

func mass() -> [Int] {
    var array: [Int] = []
    for num in 1...100 {
        array.append(num)
    }
    return array
}
print(mass())

////////////////Задание 4. Удалить из этого массива все четные числа и все числа, которые не делятся на 3
func del() -> [Int] {
    var array = mass()
    array.removeAll(where: {($0 % 2 == 0) || ($0 % 3 != 0)})
    return array
}
print(del())

///////////////Задача 5. * Написать функцию, которая добавляет в массив новое число Фибоначчи, и добавить при помощи нее 50 элементов.Числа Фибоначчи определяются соотношениями Fn=Fn-1 + Fn-2.

func febon(n: Int) -> [Int] {
    var array = [0,1]
    guard (n > 0) else {
        return []
    }
     if (n == 1){
        return [0]
    } else if (n == 2){
        return array
    } else {
        for index in 2...n{
            array.append(array[index-2]+array[index-1])
        }
        return array
    }
}
print(febon(n: 50))




//////////////////Задание 6. * Заполнить массив из 100 элементов различными простыми числами. Натуральное число, большее единицы, называется простым, если оно делится только на себя и на единицу. Для нахождения всех простых чисел не больше заданного числа n, следуя методу Эратосфена, нужно выполнить следующие шаги:
/*
a. Выписать подряд все целые числа от двух до n (2, 3, 4, ..., n).
b. Пусть переменная p изначально равна двум — первому простому числу.
c. Зачеркнуть в списке числа от 2 + p до n, считая шагом p..
d. Найти первое не зачёркнутое число в списке, большее, чем p, и присвоить значению переменной p это число.
e. Повторять шаги c и d, пока возможно.
*/

// Вариант 1
func zadacha6() -> [Int] {
    var array = [2, 3, 5, 7, 11]
    var k = 12
    while array.count != 100 {
        if (k % 2) != 0 {
            if (k % 3) != 0 {
                if (k % 5) != 0 {
                    if (k % 7) != 0 {
                        if (k % 11) != 0 {
                            array.append(k)
                        }
                    }
                }
            }
        }
        k += 1
    }
    return array
}
print(zadacha6())

// Вариант 2
func removeElement(p: Int, array: [Int]) -> [Int] {
    var mas = array
    var k = p * 2
    while k <= array.last ?? 100 {
        mas.removeAll(where: { $0 == k })
        k += p
    }
    return mas
}

func z6() -> [Int] {
    var array = mass()
    var p = 2
    array = removeElement(p: p, array: array)
    while p < array.last ?? 100 {
        let index = array.firstIndex(where: { $0 == p}) ?? 0
        p = array[index + 1]
        array = removeElement(p: p, array: array)
    }
    return array
}

print(z6())
