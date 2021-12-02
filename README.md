# News API

## Design Views
- I can use the 3 methods to design the views `Storyboard`, `XIB`, `Coding` but I prefer coding 

## Design Patterns
- I used structural design pattern (MVP) 
- of course I used delegate pattern to delegate tableview
- I used Singleton pattern when I used UserDefault becase I wanna one instance in application

## Style Of (MVP) Pattern
1. `ViewController` : is a class extended `UIViewController` and this class has instance from presenter and view (Design)
2. `View`: contain the design of the screen and functions that change views (height, width, add views, change state)
3. `Presenter` : contain the login of this screen and I can notify controller by protocols and this class has instance from interactor to get data from data store (API, Core data, etc...)
4. `Interactor` : this class is responsible for get data from Network layer and send data to presenter

### I was created the templete for this pattern and  I write the article on medium to explain this and you can check  it by this [link](https://medium.com/swiftcairo/creating-mvp-template-with-base-view-controller-e232a12146e6)

