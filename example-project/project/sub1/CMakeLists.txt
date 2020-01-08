cmake_minimum_required(VERSION 3.10.2)
project(sub1)


add_library(
	sub1 STATIC
	src/func.cpp
)

target_include_directories(sub1 PUBLIC inc)

