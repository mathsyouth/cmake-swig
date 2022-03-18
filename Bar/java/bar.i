%module Globals

%include "std_vector.i"
%include "std_string.i"
%include "std_pair.i"
%include "base.i"

%template(StringVector) std::vector<std::string>;
%template(StringJaggedArray) std::vector<std::vector<std::string>>;

%template(IntPair) std::pair<int, int>;
%template(PairVector) std::vector<std::pair<int, int>>;
%template(PairJaggedArray) std::vector<std::vector<std::pair<int, int>>>;

// Add necessary symbols to generated header
%{
#include <bar/Bar.hpp>
%}

%ignore "";
%define %unignore %rename("%s") %enddef

%unignore bar;
namespace bar {
%unignore stringVectorOutput(int);
%unignore stringVectorInput(std::vector<std::string>);
%unignore stringVectorRefInput(const std::vector<std::string>&);

%unignore stringJaggedArrayOutput(int);
%unignore stringJaggedArrayInput(std::vector<std::vector<std::string>>);
%unignore stringJaggedArrayRefInput(const std::vector<std::vector<std::string>>&);

%unignore pairVectorOutput(int);
%unignore pairVectorInput(std::vector<std::pair<int, int>>);
%unignore pairVectorRefInput(const std::vector<std::pair<int, int>>&);

%unignore pairJaggedArrayOutput(int);
%unignore pairJaggedArrayInput(std::vector<std::vector<std::pair<int, int>>>);
%unignore pairJaggedArrayRefInput(const std::vector<std::vector<std::pair<int, int>>>&);

%unignore freeFunction(int);
%unignore freeFunction(int64_t);

%unignore Bar;
%unignore Bar::staticFunction(int);
%unignore Bar::staticFunction(int64_t);

%unignore Bar::getInt() const;
%unignore Bar::setInt(int);

%unignore Bar::getInt64() const;
%unignore Bar::setInt64(int64_t);

%rename ("toString") Bar::operator();
} // namespace bar

// Process symbols in header
%include "bar/Bar.hpp"

%unignore ""; // unignore all
