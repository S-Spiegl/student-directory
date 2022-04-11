@students = []

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


def interactive_menu
  loop do
    #Print menu and ask user what they want to do
    #read input and save it to a variable
    print_menu
    process(gets.chomp)
    #do what user has asked
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
end

def save_students
  # open the file for writing - If we want to write to a file in Ruby,
  # we need to 'open' the file first. The open() method returns us a
  # reference to the file that we can save as a variable called 'file'
  file = File.open("students.csv", "w")
  #iterate over the array of (hashes of) students
  @students.each do |student|
    # On every iteration we create a new array with the student name and the cohort,
     # that is, the information we want to save to the file.
    student_data = [student[:name], student[:hobbies], student[:height], student[:birthplace], student[:cohort]]
    # We do this in order to convert it to a comma-separated string on the next line.
    # CSV stands for comma-separated variable, which is exactly what we're creating here.
    csv_line = student_data.join(",")
    # Below, we write the csv line to the file using the familiar puts() method, except
    # we call it on a file, so it writes to the file and not on the screen.
    file.puts csv_line
  end
  file.close
end

def load_students
  file = File.open("students.csv", "r")
  file.readlines.each do |line|
    name, hobbies, height, birthplace, cohort = line.chomp.split(',')
    @students << {name: name, hobbies: hobbies, height: height, birthplace: birthplace, cohort: cohort}
    #
  end
  puts "students loaded"
  file.close
end
# the above happens in order of input line... so at the moment
#it isn't working because the second line is hobbies, and it's expecting
#the second line to be cohort... have tried loading in the keys and values
#for the other inputs - name, cohort etc but to no avail...



def show_students
  print_header
  print_students_list(@students)
  print_footer(@students)
end

def process(selection)
  case selection
  when "1"
    #input students
    @students = input_students #a bit confused by this line. why not just input_students?
    #really need to go through this and work out how these instance variables are interacting...
  when "2"
    show_students
  when "3"
    save_students
  when "4"
    load_students
  when "9"
    exit
  else
    puts "I don't know what you mean. Try again"
  end
end

def print_header
  puts "The students of Villains Academy"
  puts "----------------------------------"
end

# def print_students_list(students)
#   students.each.with_index do |student, index|
#     puts "#{index+1}: #{student[:name]}, Height: #{student[:height]}, Birthplace: #{student[:birthplace]}, Hobbies: #{student[:hobbies]}. (#{student[:cohort]} cohort)"
#   end
# end
#for a simpler print function, run the above and comment
#out the below

def print_students_list(students)
  months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
  puts "enter cohort"
  user = gets.chomp
  until months.include? user
    puts "enter cohort"
    user = gets.chomp
  end
    students.each.with_index do |student, index|
    if student[:cohort] == user
      puts "#{index+1}: #{student[:name]}, Hobbies: #{student[:hobbies]}, Height: #{student[:height]}, Birthplace: #{student[:birthplace]}. (#{student[:cohort]} cohort)"
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

interactive_menu
# students = input_students
# print_header
# print(@students)
# print_footer(@students)
