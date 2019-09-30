# CMake script file to process a text file by wrapping every line in double quotes.
# Input file must not abuse quotes, staying with single quotes is probably best.
# note also empty lines cannot be stripped: they have a meaning (separator) in markdown
# so we use file( READ ... ) to read the full file content, including empty lines

file( READ ${inputFile} buffer )

file( WRITE ${outputFile} "// Do not edit this file, it is autogenerated by CMake from an .md file\n" )

# Replace each EOL char by "\n" + " + EOL
STRING(REGEX REPLACE "\"" "\\\\\"" linem ${buffer})
STRING(REGEX REPLACE "\n" "\\\\n\"\n\"" buff_m ${linem})

# Write the buffer between quotes
file( APPEND ${outputFile} "_HKI( \"" ${buff_m} "\" )\n" )
