def interactive_menu
  students = []
  loop do
    #Print menu and ask user what they want to do
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit"
    #read input and save it to a variable
    selection = gets.chomp
    #do what user has asked
    case selection
    when "1"
      #input students
      students = input_students
    when "2"
      #show students
      print_header
      print(students)
      print_footer(students)
    when "9"
      exit
    else
      puts "I don't know what you mean. Try again"
    end
  end
end
#ask for additional info
def input_students
  puts "Please enter the name of the student"
  puts "To finish, just hit return twice"
  students = []
  months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
  #get the first name
  name = gets.chomp
  puts "Please enter the student's hobbies"
  hobbies = gets.chomp
  puts "Please enter the student's height"
  height = gets.chomp
  puts "Please enter the student's country of birth"
  birthplace = gets.chomp
  puts "Please enter the student's cohort"
  cohort = gets.chomp #added .to_sym as per request of exercise 7. Not sure what this does...
    until months.include? cohort
      puts "Please enter the student's cohort!"
      cohort = gets.chomp
    end
  #while the name is not empty, repeat this code (i.e. as long as they enter something)
  while !name.empty?
    students << {name: name, cohort: cohort, hobbies: hobbies, height: height, birthplace: birthplace}
    if students.count == 1
      puts "Now we have #{students.count} student"
    else
      puts "Now we have #{students.count} students"
  end
    #get another name
    puts "Please enter the name of the student or enter to quit"
    name = gets.chomp
    break if name == ""
    puts "Please enter the student's hobbies"
    hobbies = gets.chomp
    puts "Please enter the student's height"
    height = gets.chomp
    puts "Please enter the student's country of birth"
    birthplace = gets.chomp
    puts "Please enter the student's cohort"
    cohort = gets.chomp #added .to_sym as per request of exercise 7. Not sure what this does...
      until months.include? cohort
        puts "Please enter the student's cohort!"
        cohort = gets.chomp
      end
  end
  # return the array of students
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "----------------------------------"
end

def print(students)
  months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
  puts "enter cohort"
  user = gets.chomp
  until months.include? user
    puts "enter cohort"
    user = gets.chomp
  end
    students.each.with_index do |student, index|
    if student[:cohort] == user
      puts "#{index+1}: #{student[:name]}, Height: #{student[:height]}, Birthplace: #{student[:birthplace]}, Hobbies: #{student[:hobbies]}. (#{student[:cohort]} cohort)"
    elsif student[:cohort] != user
      puts "No students in this cohort"
      #how to get this not to print when multiple cohorts?
    end
  end
end

def print_footer(names)
  if names.count == 1
    puts "Overall we have #{names.count} great student"
  else
    puts "Overall we have #{names.count} great students"
  end
  #this only worked with puts, not with print... gave undefined method otherwise... wonder why...
end

students = input_students
print_header
print(students)
print_footer(students)
