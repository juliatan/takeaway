require './lib/client'
require './lib/dish'
require './lib/menu'
require './lib/order'
require './lib/ui'

menu = Menu.new

dish1 = Dish.new("Tomato Soup", "£1.50")
dish2 = Dish.new("Vegetable Soup", "£2.50")
dish3 = Dish.new("Minestrone Soup", "£3.50")
dish4 = Dish.new("Beef Soup", "£4.50")
dish5 = Dish.new("Chicken Soup", "£5.50")

menu.add(dish1)
menu.add(dish2)
menu.add(dish3)
menu.add(dish4)
menu.add(dish5)

order = Order.new
ui = UI.new

ui.ordering_process(order, menu)