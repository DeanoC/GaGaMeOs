get_filename_component(COMPILER_PATH ${CMAKE_CURRENT_LIST_DIR}/compilers/ REALPATH)

set(GCC_VERSION 14.2.0)
set(CMAKE_SYSTEM_NAME RISCV_BARE_METAL)

# Set paths for various compiler tools using the COMPILER_PATH
if(WIN32)
  set(CMAKE_ADDR2LINE ${COMPILER_PATH}/bin/riscv64-unknown-elf-addr2line.exe)
  set(CMAKE_AR ${COMPILER_PATH}/bin/riscv64-unknown-elf-ar.exe)
  set(CMAKE_RANLIB ${COMPILER_PATH}/bin/riscv64-unknown-elf-ranlib.exe)
  set(CMAKE_NM ${COMPILER_PATH}/bin/riscv64-unknown-elf-nm.exe)
  set(CMAKE_OBJCOPY ${COMPILER_PATH}/bin/riscv64-unknown-elf-objcopy.exe)
  set(CMAKE_OBJDUMP ${COMPILER_PATH}/bin/riscv64-unknown-elf-objdump.exe)
  set(CMAKE_READELF ${COMPILER_PATH}/bin/riscv64-unknown-elf-readelf.exe)
  set(CMAKE_STRIP ${COMPILER_PATH}/bin/riscv64-unknown-elf-strip.exe)
  set(CMAKE_ASM_COMPILER ${COMPILER_PATH}/bin/riscv64-unknown-elf-gcc.exe)
  set(CMAKE_C_COMPILER ${COMPILER_PATH}/bin/riscv64-unknown-elf-gcc.exe)
  set(CMAKE_C_COMPILER_AR ${COMPILER_PATH}/bin/riscv64-unknown-elf-ar.exe)
  set(CMAKE_C_COMPILER_RANLIB ${COMPILER_PATH}/bin/riscv64-unknown-elf-ranlib.exe)
  set(CMAKE_CXX_COMPILER ${COMPILER_PATH}/bin/riscv64-unknown-elf-g++.exe)
  set(CMAKE_LINKER ${COMPILER_PATH}/bin/riscv64-unknown-elf-ld.exe)
else()
  set(CMAKE_ADDR2LINE ${COMPILER_PATH}/bin/riscv64-unknown-elf-addr2line)
  set(CMAKE_AR ${COMPILER_PATH}/bin/riscv64-unknown-elf-ar)
  set(CMAKE_RANLIB ${COMPILER_PATH}/bin/riscv64-unknown-elf-ranlib)
  set(CMAKE_NM ${COMPILER_PATH}/bin/riscv64-unknown-elf-nm)
  set(CMAKE_OBJCOPY ${COMPILER_PATH}/bin/riscv64-unknown-elf-objcopy)
  set(CMAKE_OBJDUMP ${COMPILER_PATH}/bin/riscv64-unknown-elf-objdump)
  set(CMAKE_READELF ${COMPILER_PATH}/bin/riscv64-unknown-elf-readelf)
  set(CMAKE_STRIP ${COMPILER_PATH}/bin/riscv64-unknown-elf-strip)
  set(CMAKE_ASM_COMPILER ${COMPILER_PATH}/bin/riscv64-unknown-elf-gcc)
  set(CMAKE_C_COMPILER ${COMPILER_PATH}/bin/riscv64-unknown-elf-gcc)
  set(CMAKE_C_COMPILER_AR ${COMPILER_PATH}/bin/riscv64-unknown-elf-ar)
  set(CMAKE_C_COMPILER_RANLIB ${COMPILER_PATH}/bin/riscv64-unknown-elf-ranlib)
  set(CMAKE_CXX_COMPILER ${COMPILER_PATH}/bin/riscv64-unknown-elf-g++)
  set(CMAKE_LINKER ${COMPILER_PATH}/bin/riscv64-unknown-elf-ld)
endif()

set(CPU_SETTINGS "${GCC_FLAGS} -march=rv32imafc -mabi=ilp32")

set(CMAKE_ASM_FLAGS "${CMAKE_ASM_FLAGS} -ggdb")
set(CMAKE_ASM_FLAGS "${CMAKE_ASM_FLAGS} -flto -ffat-lto-objects")
set(CMAKE_ASM_FLAGS "${CMAKE_ASM_FLAGS} ${CPU_SETTINGS}")

set(CMAKE_C_STANDARD_INCLUDE_DIRECTORIES
			${COMPILER_PATH}/lib/gcc/riscv64-unknown-elf/${GCC_VERSION}/include
      ${COMPILER_PATH}/lib/gcc/riscv64-unknown-elf/${GCC_VERSION}/include-fixed)
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -ggdb")
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -flto -ffat-lto-objects")
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -nostartfiles -nostdlib -nostdinc -ffreestanding")
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wall -Wpedantic -Wno-builtin-declaration-mismatch")
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${CPU_SETTINGS} -std=gnu2x")

set(CMAKE_CXX_STANDARD_INCLUDE_DIRECTORIES
			${COMPILER_PATH}/lib/gcc/riscv64-unknown-elf/${GCC_VERSION}/include
      ${COMPILER_PATH}/lib/gcc/riscv64-unknown-elf/${GCC_VERSION}/include-fixed)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -ggdb")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -flto -ffat-lto-objects")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -nostartfiles -nostdlib -nostdinc -ffreestanding -fno-rtti -fno-exceptions")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -Wpedantic -Wno-builtin-declaration-mismatch")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${CPU_SETTINGS} -std=gnu++20")

set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -nostartfiles -nostdlib -nostdinc -ffreestanding")