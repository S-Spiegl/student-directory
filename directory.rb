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

# def input_students
#   puts "Please enter the name of the students"
#   puts "To finish, just hit return twice"
#   #create an empty array
#   students = []
#   #get the first name
#   name = gets.chomp
#   #while the name is not empty, repeat this code (i.e. as long as they enter something)
#   while !name.empty? do
#     #add the student hash to the array - if you want to see the array, put a puts
#     #before students below
#     students << {name: name, cohort: :november}
#     puts "Now we have #{students.count} students"
#     #get another name
#     name = gets.chomp #ignore this bit and you get an endless loop
#   end
#   # return the array of students
#   students
# end

#ask for additional info
def input_students
  puts "Please enter the name of the student"
  puts "To finish, just hit return twice"
  students = []
  months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
  #create an empty array
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
    # # if cohort.empty?
    # #   cohort = "unspecified"
    # end
  #while the name is not empty, repeat this code (i.e. as long as they enter something)
  while !name.empty?
    #add the student hash to the array - if you want to see the array, put a puts
    #before students below
    students << {name: name, cohort: cohort, hobbies: hobbies, height: height, birthplace: birthplace}
    if students.count == 1
      puts "Now we have #{students.count} student"
    else
      puts "Now we have #{students.count} students"
  end
    #get another name
    puts "Please enter the name of the student"
    name = gets.chomp
    break if name == ""
    puts "Please enter the student's hobbies"
    hobbies = gets.chomp
    puts "Please enter the student's height"
    height = gets.chomp
    puts "Please enter the student's country of birth"
    birthplace = gets.chomp
    puts "Please enter the student's cohort"
    cohort = gets.chomp.to_sym #added .to_sym as per request of exercise 7. Not sure what this does...
      until months.include? cohort
        puts "Please enter the student's cohort!"
        cohort = gets.chomp.to_sym
      end
  end
  # return the array of students
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "----------------------------------"
end

#print student with number before name
# def print(students)
#   students.each.with_index do |student, index|
#     puts "#{index+1}. #{student[:name]}, Height: #{student[:height]}, Birthplace: #{student[:birthplace]}, Hobbies: #{student[:hobbies]}. (#{student[:cohort]} cohort)".center(40, "-")
#   end
# end

# change the way students are printed to be by cohort
def print(students)
  students.each.with_index do |student, index|
    puts "#{index+1}. #{student[:name]}, Height: #{student[:height]}, Birthplace: #{student[:birthplace]}, Hobbies: #{student[:hobbies]}. (#{student[:cohort]} cohort)".center(40, "-")
  end
end

# #print only students beginning with certain letter
# def print(students)
#   students.each do |student|
#     if student[:name].capitalize.start_with?("S")
#     puts "#{student[:name]} (#{student[:cohort]} cohort)"
#     end
#   end
# end

#print only students whose names are shorter that 12 chars
# def print(students)
#   students.each do |student|
#     if student[:name].length < 12
#       puts "#{student[:name]} (#{student[:cohort]} cohort)"
#     end
#   end
# end

#rewrite each(method) to use while or until - can't make this work without each method... when
# I try and get the value from the students array I get ano implicit conversion of Symbol into Integer (TypeError)
#error message
# def print(students)
# i = 0
#   while true do
#     i += 1
#     # students[:name]
#     # students.each {|student| puts "#{student[:name]} (#{student[:cohort]} cohort")}
#     break
#   end
# end


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
