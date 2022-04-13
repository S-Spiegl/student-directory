# students = [
# {name: "Dr Hannibal Lecter", cohort: :november},
# {name: "Darth Vader", cohort: :november},
# {name: "Nurse Ratched", cohort: :november},
# {name: "Michael Corleone", cohort: :november},
# {name: "Alex deLarge", cohort: :november},
# {name: "The Wicked Witch of the West", cohort: :november},
# {name: "Terminator", cohort: :november},
# {name: "Freddy Kruger", cohort: :november},
# {name: "The Joker", cohort: :november},
# {name: "Joffrey Baratheon", cohort: :november},
# {name: "Norman Bates", cohort: :november},
# {name: "Nosferatu", cohort: :november},
# {name: "Vlad, Impaler", cohort: :november}]

def input_students
  puts "Please enter the name of the students"
  puts "To finish, just hit return twice"
  #create an empty array
  students = []
  #get the first name
  name = gets.chomp
  #while the name is not empty, repeat this code (i.e. as long as they enter something)
  while !name.empty? do
    #add the student hash to the array - if you want to see the array, put a puts
    #before students below
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    #get another name
    name = gets.chomp #ignore this bit and you get an endless loop
  end
  # return the array of students
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "----------------------------------"
end

def print(students)
  i = 0
  while true do
    puts "#{students[i]} (#{students[i]} cohort)"
    break if i == 4
    i += 1
      while true do |key, value|
        puts key
      end
  end
end

# {:name=>"one", :cohort=>:november}
# {:name=>"two", :cohort=>:november}
# {:name=>"three", :cohort=>:november}

# def print(students)
# i = 0
#   while true do
#     i += 1
#     students[:name]
#     students.each {|student| puts "#{student[:name]} (#{student[:cohort]} cohort)"}
#     break
#   end
# end

def print_footer(names)
  puts "Overall we have #{names.count} great students"
  #this only worked with puts, not with print... gave undefined method otherwise... wonder why...
end

puts students = input_students
print_header
print(students)
print_footer(students)
