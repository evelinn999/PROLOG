CXX = c++




build : validador.o main.o
	$(CXX) obj/validador.o obj/main.o -o bin/output

run : bin/output
	clear
	./bin/output

$(wildcard obj/*.o) : src/validador.cxx src/validador.h
	$(CXX) -c src/validador.cxx -o obj/validador.o 

main.o : src/main.cxx
	$(CXX) -c src/main.cxx -o obj/main.o

clean:
	rm -f bin/* obj/*.o