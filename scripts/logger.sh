#!/bin/bash
# Read input from stdin (piped text)
input=$(cat)

# Get the filename from the first argument (passed via %{buffer_name} expansion)
filename="$1"
ext="${filename##*.}"

# Output based on file extension
case "$ext" in
  js|jsx|ts|tsx)
    echo "console.log($input);"
    ;;
  py)
    echo "print($input)"
    ;;
  go)
    echo "fmt.Println($input)"
    ;;
  rs)
    echo "println!(\"{:?}\", $input);"
    ;;
  rb)
    echo "puts $input"
    ;;
  php)
    echo "var_dump(\$$input);"
    ;;
  java)
    echo "System.out.println($input);"
    ;;
  cs)
    echo "Console.WriteLine($input);"
    ;;
  cpp|cc|cxx|c)
    echo "std::cout << $input << std::endl;"
    ;;
  *)
    # Default to console.log for unknown types
    echo "console.log($input);"
    ;;
esac
