# file = CSV.open("directory_sandbox.csv", "w") do |csv|
#   csv << ["row", "of", "csv", "data"]
#   csv << ["another", "row"]
# end
@students = []
require 'csv'

# file = CSV.read("students5.csv")
# @students << file
#
# file2 = CSV.parse("1. here\n2. are\n3. some\n4. things")
# file2
#
# file3 = CSV.open("file3.csv", "w") do |csv|
#   csv << ["row", "of", "things"]
#   csv << ["other", "THINGS"]
#   file3
# end

CSV.foreach("students2.csv", "r") do |row|
  @students << row[1]
end

print @students
