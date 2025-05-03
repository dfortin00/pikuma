
# Locate NASM on the local machine.
find_program(NASM_EXECUTABLE nasm.exe)

# Check if NASM was found.
if (NOT NASM_EXECUTABLE)
    message(FATAL_ERROR "-- NASM (nasm.exe) not found! Please install NASM and make sure it can be located in your PATH.")
else()
    message(STATUS "-- Found NASM: ${NASM_EXECUTABLE}")
endif()

# Locate Perl on the local machine.
find_program(PERL_EXECUTABLE perl.exe)

# Check if Perl was found.
if (NOT PERL_EXECUTABLE)
    message(FATAL_ERROR "-- Perl (perl.exe) not found! Please install Perl and make sure it can be located in your PATH")
else()
    message(STATUS "-- Found Perl: ${PERL_EXECUTABLE}")
endif()
