require_relative 'sms'

class UI

  include SMS

  def input
    gets.chomp
  end

  def prompt
    ">  "
  end

  def header
    "********* JULIA'S SOUP FACTORY **********\n\n"
  end

  def footer
    "\n************** End of menu **************\n\n"
  end

  def choice_instruction
    "Please key in the name of the dish you would like"
  end

  def ask_for_quantity_instruction
    "\nHow many would you like?"
  end

  def anything_else_instruction
    "\nKey in your next choice, otherwise enter 'checkout'."
  end

  def proceed_instruction
    "\nGreat, let's proceed to the checkout!"
  end


  def ordering_process(order, menu)
    puts header
    puts menu.display
    puts footer
    puts choice_instruction
    
    client_adds_to(order, menu) # this is a loop

    puts proceed_instruction
    checkout_process(order)
  end

  def client_adds_to(order, menu)
    loop do
      print prompt
      
      dish_name = input
      
      # checkout?(dish_name)
      break if dish_name == 'checkout'
      
      # redo_if_dish_not_in_menu(menu, dish_name)
      check_array = available_dishes_from(menu, dish_name)
        
      if check_array.all? { |item| item == false }
        puts wrong_dish_instruction
        redo
      end

      puts ask_for_quantity_instruction
      print prompt
      quantity = input.to_i

      add_to_order(order, menu)
      
      puts anything_else_instruction
    end
  end

  # def checkout?(dish_name)
  #   break if dish_name == 'checkout'
  # end

  def available_dishes_from(menu, dish_name)
    menu.contents.map do |dishes|
        dishes.has_value?(dish_name)
    end
  end

  # def redo_if_dish_not_in_menu(menu, dish_name)
  #   check_array = available_dishes_from(menu, dish_name)
        
  #   if check_array.all? { |item| item == false }
  #     puts wrong_dish_instruction
  #     redo
  #   end
  # end

  def wrong_dish_instruction
    "Sorry, this dish does not exist, please try again"
  end

  def add_to_order(order, menu)
    selected_dish = menu.contents.select do |dish|
      dish[:name] == dish_name
    end

    order.add(selected_dish[0][:dish], quantity)
  end

  def checkout_process(order)
    puts confirm_choices_instruction
    puts order.display

    order.add_to_cost_array

    puts confirm_total_cost_instruction
    client_confirms_cost_of(order) # this is a loop
  end

  def client_confirms_cost_of(order)
    loop do
      print prompt
      user_thinks_cost_is = input
      
      if user_thinks_cost_is == order.total_cost
        puts cost_confirmed_instruction #SMS!!
        get_client_details
        break
      else
        raise RuntimeError.new(decline_order_instruction)
      end
    end
  end

  def confirm_choices_instruction
    "\nHere is what you have ordered:"
  end

  def confirm_total_cost_instruction
    "\nPlease confirm the total cost you expect to pay e.g. £5.00"
  end

  def cost_confirmed_instruction
    "\nThank you! We will now need your name and phone number to send confirmation of your order."
  end

  def decline_order_instruction
    "\nSorry, that is not the correct amount."
  end

  def get_client_details
    puts get_name_instruction
    print prompt
    name = input

    puts get_phone_number_instruction
    print prompt
    phone_number = input

    user = Client.new(name, phone_number)
    time = Time.now

    puts confirmation_sent_instruction
    self.send_sms(user, time)
  end

  def get_name_instruction
    "\nWhat is your name?"
  end

  def get_phone_number_instruction
    "\nWhat is your phone number?"
  end

  def confirmation_sent_instruction
    "\nThank you. You will receive a text message shortly with a confirmation of your order."
  end

end