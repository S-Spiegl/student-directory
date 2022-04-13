@students = []
@months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]

def try_load_students(filename = "students.csv")
  # filename = ARGV.first
  # return if filename.nil?
  if File.exist?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} student/s from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist"
    exit
  end
end

def load_students(filename = "students.csv")
  puts "Please enter the name of the file you would like to load"
  filename = STDIN.gets.chomp
  if File.exist?(filename)
    file = File.open(filename, "r")
    file.readlines.each do |line|
      name, hobbies, height, birthplace, cohort = line.chomp.split(',')
      @students << {name: name, hobbies: hobbies, height: height, birthplace: birthplace, cohort: cohort}
      puts "students successfully loaded from #{filename}"
      file.close
    end
  elsif !File.exist?(filename)
    puts "Sorry, #{filename} doesn't exist. Please try again."
  end
end

def input_students
  puts "Please enter the name of the student"
  puts "To finish, just hit return twice"
  name = STDIN.gets.chomp
  puts "Please enter the student's hobbies"
  hobbies = STDIN.gets.chomp
  puts "Please enter the student's height"
  height = STDIN.gets.chomp
  puts "Please enter the student's country of birth"
  birthplace = STDIN.gets.chomp
  puts "Please enter the student's cohort"
  cohort = STDIN.gets.chomp
    until @months.include? cohort
      puts "Please enter the student's cohort!"
      cohort = STDIN.gets.chomp
    end
  while !name.empty?
    @students << {name: name, cohort: cohort, hobbies: hobbies, height: height, birthplace: birthplace}
    if @students.count == 1
      puts "Now we have #{@students.count} student"
    else
      puts "Now we have #{@students.count} students"
  end
    #get another name
    puts "Please enter the name of the student or enter to quit"
    name = STDIN.gets.chomp
    break if name == ""
    puts "Please enter the student's hobbies"
    hobbies = STDIN.gets.chomp
    puts "Please enter the student's height"
    height = STDIN.gets.chomp
    puts "Please enter the student's country of birth"
    birthplace = STDIN.gets.chomp
    puts "Please enter the student's cohort"
    cohort = STDIN.gets.chomp
      until @months.include? cohort
        puts "Please enter the student's cohort!"
        cohort = STDIN.gets.chomp
      end
  end
  @students
end


def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list"
  puts "4. Load the list"
  puts "9. Exit"
end

def process(selection)
  case selection
  when "1"
    @students = input_students
  when "2"
    show_students
  when "3"
    save_students
  when "4"
    load_students
  when "9"
    puts """
    ****************
    Programme closed
        Goodbye
    ****************
    """
    exit
  else
    puts "I don't know what you mean. Try again"
  end
end

def save_students
  puts "choose the name of your save file"
  save_destination = STDIN.gets.chomp
  file = File.open(save_destination, "w")
  @students.each do |student|
    student_data = [student[:name], student[:hobbies], student[:height], student[:birthplace], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
  puts """
  **********************
  saved to #{save_destination}
  **********************
  """
end

def show_students
  print_header
  print_students_list(@students)
  print_footer(@students)
end

def print_header
  puts "The students of Villains Academy"
  puts "----------------------------------"
end

def print_students_list(students)
  puts "Enter the month of the cohort you would like to display"
  user = STDIN.gets.chomp
  until @months.include? user
    puts "enter cohort"
    user = STDIN.gets.chomp
  end
    students.each.with_index do |student, index|
    if student[:cohort] == user
      puts "#{index+1}: #{student[:name]}, Hobbies: #{student[:hobbies]}, Height: #{student[:height]}, Birthplace: #{student[:birthplace]}. (#{student[:cohort]} cohort)"
    elsif student[:cohort] != user
      puts "No students in this cohort"
    end
  end
end

def print_footer(names)
  if names.count == 1
    puts "Overall we have #{names.count} great student"
  else
    puts "Overall we have #{names.count} great students"
  end
end

try_load_students
interactive_menu
