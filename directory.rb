students = ["Dr Hannibal Lecter", "Darth Vader", "Nurse Ratched", "Michael Corleone",
"Alex deLarge", "The Wicked Witch of the West", "Terminator", "Freddy Kruger", "The Joker",
"Joffrey Baratheon", "Norman Bates", "Nosferatu"]

def print_header
  puts "The students of Villains Academy"
  puts "----------------------------------"
end

def print(names)
  names.each do |name|
    puts name
  end
end

def print_footer(names)
  puts "Overall we have #{names.count} great students"
  #this only worked with puts, not with print... gave undefined method otherwise... wonder why...
end

print_header
print(students)
print_footer(students)
