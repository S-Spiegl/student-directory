#copy for purposes of completing question 7

@students = [] # an empty array accessible to all methods

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit" # 9 because we'll be adding more items
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "9"
    exit # this will cause the program to terminate
  when "3"
    save_students
  when "4"
    load_students
  else
    puts "I don't know what you meant, try again"
  end
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # get the first name
  name = STDIN.gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    @students << {name: name, cohort: :november}
    puts "Now we have #{@students.count} students"
    # get another name from the user
    name = STDIN.gets.chomp
  end
end

def show_students
  print @students[0][:name] #test for self
  print_header
  print_student_list
  print_footer
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_student_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end


#need to get this to loop - see counter below. It saves it as a csv but need to find a way to automate
#the filling of the csv argument with the info in the square brackets... normal loop doesn't
#seem to work...
#also need to get rid of speech marks and square brackets

def save_students
  require 'CSV'
  # open the file for writing
    counter = 0
    file = CSV.open("students.csv", "w")  do |csv|
      csv << [[@students[counter][:name]],[@students[counter][:cohort]]]
    end
  file.close
end

def load_students(filename = "students.csv")
  require 'CSV'
  file = File.open(filename, "r")
    #need to work out how to edit the below to fit the CSV model
  file.readlines.each do |line|
  name, cohort = line.chomp.split(',')
    @students << {name: name, cohort: cohort}
  end
  file.close
end

def try_load_students
  filename = ARGV.first# first argument from the command line
  if filename.nil? # get out of the method if it isn't given
    return
  elsif File.exists?(filename) # if it exists
    load_students(filename)
     puts "Loaded #{@students.count} from #{filename}"
  else # if it doesn't exist
    puts "Sorry, #{filename} doesn't exist."
    exit # quit the program
  end
end

try_load_students
interactive_menu
