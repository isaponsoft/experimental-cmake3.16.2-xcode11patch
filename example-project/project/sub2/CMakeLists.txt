cmake_minimum_required(VERSION 3.10.2)
project(sub2)


add_library(
	sub2 STATIC
	src/func.cpp
)

target_include_directories(sub2 PUBLIC inc)

