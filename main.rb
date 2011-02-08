#Initialize used variables
#Define the default palettes to generate strings from
palette = ["abcdefghijklmnopqrstuvwxyz",
           "0123456789",
           "abcdefghijklmnopqrstuvwxyz0123456789"]
#Controls which palette to use
palette_mode = 0
#Controls how many strings there will be generated
generate_count = 10
#Controls how to seperate the diffrent strings
string_seperator = "\n"
#Reserve a variable for a custom palette
custom_palette = nil
#Controls the minimum length of the generated string
string_min_length = 8
#Controls the maximum length of the generated string
string_max_length = 12
#Allow to have arguements given and still function
allow_no_arguements = true
#Check if there was given any arguements to the program
if (ARGV.length < 1 && allow_no_arguements == false) 
    puts "I was fed any arguements, now I'll starve to death...!"
    puts "*Program dies... slowly and painfully...*"
    exit
end

#Begin looping through ARGV to see what the user wants
ARGV.length.times do |i| 
    var = ARGV[i]

    if (var == "--a")
        palette_mode = 0
    elsif (var == "--n")
        palette_mode = 1
    elsif (var == "--an")
        palette_mode = 2
    elsif (var.index(/^--count=/) != nil) 
        var = var.gsub /^--count=/, ''
        generate_count = var.to_i
    elsif (var.index(/^--seperate_with=/) != nil)
        var = var.gsub /^--seperate_with=/, ''
        string_seperator = var
    elsif (var.index(/^--char_palette=/) != nil)
        var = var.gsub /^--char_palette=/, ''
        palette.push var
        palette_mode = 3
    elsif (var.index(/^--append_palette=/) != nil)
        var = var.gsub /^--append_palette=/, ''
        palette[palette_mode] << var
    elsif (var.index(/^--min_length=/) != nil)
        var = var.gsub /^--min_length/, ''
        string_min_length = var.to_i if (var.to_i < string_max_length)
    elsif (var.index(/^--max_length=/) != nil)
        var = var.gsub /^--max_length=/, ''
        string_max_length = var.to_i if (var.to_i > string_min_length)
    else
        puts "Unrecognized option: #{var}."
    end
    
end
#Calculate the diffrence between min and max
string_length_diffrence = (string_max_length - string_min_length) + 1
#Generate string(s)!
generate_count.times do |i|
    #var will hold the newly generated string
    var ||= ""
    #tmp will hold the length of the string to generate
    tmp = string_min_length + (rand(string_length_diffrence))
    tmp.times do |i|
        var << palette[palette_mode][rand(palette[palette_mode].size)]
    end
    print "#{var}#{string_seperator}"
end

#Basicly just to print a new line, so I'm sure it's not gonna clutter
# with the next command input in the Terminal
puts if (string_seperator != "\n")
