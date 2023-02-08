@students = [] # an empty array accessible to all methods

def input_students
    puts "Please, enter the names of the students"
    puts "To finish, just hit return twice"
    #get the first name
    name = gets.chomp
    #while the name is not empty, repeat this code
    while !name.empty? do
        #add the student hash to the array
        @students << {name: name, cohort: :november}
        puts "Now we have #{@students.count} students"
        #get another name from the user
        name = gets.chomp
    end
end

def interactive_menu
  loop do 
    print_menu
    process(gets.chomp)
  end
end
# interactive_menu

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "9. Exit"
end

def show_students
    print_header
    print_students_list
    print_footer
end

def process(selection)
    case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      save_students
    when "9"    
      exit
    else 
      puts "I don't know what you meant, try again"
    end
end 

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_students_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

def save_students
    #open file for writing
    file = File.open("students.csv", "w") #When we open a file, the open() 
    #method returns us a reference to the file that we can save as a variable 
    #called 'file'. 
    #Then we iterate over the array of students, processing one student at a time.
    @students.each do |student|
      student_data = [student[:name], student[:cohort]] #Our data is stored in a hash, 
      # therefore we need to convert the hash into a string to write to the file. An easy 
      # way to do it is to put all elements of the hash into an array and then convert it 
      # all to the string. An easy way to do it is to put all elements of the hash into an 
      # array and then convert it all to the string.  
      # On every iteration we create a new array with the student name and the cohort, 
      # that is, the information we want to save to the file. We do this in order to 
      # convert it to a comma-separated string on the next line. 
      csv_line = student_data.join(",")
      file.puts csv_line #Finally, we write the csv line to the file using the 
      # familiar puts() method, except we call it on a file, so it writes to the 
      # file and not on the screen.
    end
    file.close #Every time you open a file, it needs to be closed.
end

interactive_menu

students = [
{name: "Dr. Hannibal Lecter", cohort: :november},
{name: "Darth Vader", cohort: :november},
{name: "Nurse Ratched", cohort: :november},
{name: "Michael Corleone", cohort: :november},
{name: "Alex DeLarge", cohort: :november},
{name: "The Wicked Witch of the West", cohort: :november},
{name: "Terminator", cohort: :november},
{name: "Freddy Krueger", cohort: :november},
{name: "The Joker", cohort: :november},
{name: "Joffrey Baratheon", cohort: :november},
{name: "Norman Bates", cohort: :november}
]