#include <iostream>
#include <stdlib.h>
#include <string>
#include <map>
#include <list>
#include "c_codegen.h"

using namespace std;

  // the constructor for node links the node to its children,
  // and stores the character representation of the operator.
  operator_node::operator_node(exp_node *L, exp_node *R) {
    left    = L;
    right   = R;
  }

  
  number_node::number_node(int value) {
    num = value;
   }
  
void number_node:: print() {
  cout << num;
}

  int number_node::evaluate() { 
    //cout << "number_node: operand = " << num << endl;
    return num; }

  id_node::id_node(string value) : id(value) {}

void id_node:: print() {
  cout << id;
}

  int id_node::evaluate() { 
    //cout << "id_node: " << id << " = " << idTable[id] << endl;
    return idTable[id]; 
  }

// add_node inherits the characteristics of node and adds its own evaluate function
  // add_node's constructor just uses node's constructor
  add_node::add_node(exp_node *L, exp_node *R) : operator_node(L,R) {
  }

void add_node:: print() {
  //cout << "(";
  //left->print();
  //cout << " + ";
  //right->print();
  //cout << ")";
  //cout << endl;
  cout << endl;
  cout << "add $s0, ";
  left->print();
  cout << ", ";
  right->print();
 
}

  int add_node::evaluate() {
    int left_num, right_num;

    left_num  = left->evaluate();
    right_num = right->evaluate();

    num = left_num + right_num;
    //cout << "add_node: " << left_num << " + " << right_num << " = " << num << "\n";
    return (num);
  }


// subtract_node inherits the characteristics of node and adds its own evaluate function
  subtract_node::subtract_node(exp_node *L, exp_node *R) : operator_node(L,R) {
  }

void subtract_node:: print() {
  //cout << "(";
  //left->print();
  //cout << " - ";
  //right->print();
  //cout << ")";
  cout << endl;
  cout << "sub $s0, ";
  left->print();
  cout << ", ";
  right->print();
}

  int subtract_node::evaluate() {
    int left_num, right_num;

    left_num  = left->evaluate();
    right_num = right->evaluate();

    num = left_num - right_num;
    //cout << "subtract_node: " << left_num << " - " << right_num << " = " << num << "\n";
    return (num);
  }


// times_node inherits the characteristics of node and adds its own evaluate function
  multiply_node::multiply_node(exp_node *L, exp_node *R) : operator_node(L,R) {
  }

void multiply_node:: print() {
  //cout << "(";
  //left->print();
  //cout << " * ";
  //right->print();
  //cout << ")";
  cout << endl;
  cout << "mul $s0, ";
  left->print();
  cout << ", ";
  right->print();
}

  int multiply_node::evaluate() {
    int left_num, right_num;

    left_num = left->evaluate();
    right_num = right->evaluate();

    num = left_num * right_num;
    //cout << "multiply_node: " << left_num << " * " << right_num << " = " << num << "\n";
    return (num);
  }


// divide_node inherits the characteristics of node and adds its own evaluate function

  divide_node::divide_node(exp_node *L, exp_node *R) : operator_node(L,R) {
  }

void divide_node:: print() {
  //cout << "(";
  //left->print();
  //cout << " / ";
  //right->print();
  //cout << ")";
  cout << endl;
  cout << "div $s0, ";
  left->print();
  cout << ", ";
  right->print();
}

  int divide_node::evaluate() {
    int left_num, right_num;

    left_num = left->evaluate();
    right_num = right->evaluate();

    if(right_num)
      {
        num = (int)left_num / (int)right_num;
        //cout << "divide_node: " << left_num << " / " << right_num << " = " << num << "\n";
        return (num);
      }
    else
      {
	//cout << "divide_node: division by zero -> " << left_num << " / " << 0 << endl;
	// you have to include stdlib.h for exit
	exit(1);
      }
  }


// modulo_node inherits the characteristics of node and adds its own evaluate function

  modulo_node::modulo_node(exp_node *L, exp_node *R) : operator_node(L,R) {
  }

void modulo_node:: print() {
  cout << "(";
  left->print();
  cout << " % ";
  right->print();
  cout << ")";
}

  int modulo_node::evaluate() {
    int left_num, right_num;

    left_num = left->evaluate();
    right_num = right->evaluate();

    if(right_num)
      {
        num = (int)left_num % (int)right_num;
        //cout << "modulo_node: " << left_num << " % " << right_num << " = " << num << "\n";
        return (num);
      }
    else
      {
	//cout << "modulo_node: mod by zero -> " << left_num << " % " << 0 << endl;
	// you have to include stdlib.h for exit
	exit(1);
      }
  }


// unary_minus_node inherits the characteristics of node and adds its own evaluate function
unary_minus_node::unary_minus_node(exp_node *L) : exp(L) {}

void unary_minus_node:: print() {
  cout << "-";
  exp->print();
}

int unary_minus_node::evaluate() {
  int expValue = exp->evaluate();
  num = -expValue;

  cout << "unary_minus_node: " << "-\t" << expValue << " = " << num << "\n";
    return num;
}

assignment_stmt::assignment_stmt(string name, exp_node *expression)
  : id(name), exp(expression) {}

void assignment_stmt::print() {
  //cout << id << " = ";
  //exp->print();
  //cout << endl;
  cout << endl; 
  cout << "mov $s0, ";
  exp->print();

}

void assignment_stmt::evaluate() {
  int result = exp->evaluate();
  //cout << "assignment_node: " << id << " = " << result << endl << endl;
  idTable[id] = result;
}

int_assignment_stmt::int_assignment_stmt(string name, exp_node *expression)
  : id(name), exp(expression) {}

void int_assignment_stmt::print() {
  //cout << "int " << id << " = ";
  //exp->print();
  //cout << endl;
  cout << endl;
  cout << "mov $s0, ";
  exp->print();
 
}

void int_assignment_stmt::evaluate() {
  int result = exp->evaluate();
  //cout << "int_assignment_node: int " << id << " = " << result << endl << endl;
  idTable[id] = result;
}

print_stmt::print_stmt (string name) : id(name) {}

void print_stmt::evaluate() {
  cout << "print_node: " << id << " = " << idTable[id] << endl << endl;
}

pgm::pgm(list<statement *> *stmtList) : stmts(stmtList) {}

void pgm::evaluate() {
  list<statement *>::iterator stmtIter;
  for (stmtIter = stmts->begin(); stmtIter != stmts->end();
       stmtIter++) {
    (*stmtIter)->print();
    (*stmtIter)->evaluate();
    cout << endl; 
  }
}

map<string, int> idTable;

