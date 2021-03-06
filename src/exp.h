#include <iostream>
#include <stdlib.h>
#include <string>
#include <map>
#include <list>

using namespace std;

class exp_node {
  public:
    int num;

    // print function for pretty printing an expression
    virtual void print() = 0;

    // evaluation function for a leaf, replaced for interior nodes
    virtual int evaluate() = 0;
};

class operator_node : public exp_node {
public:
    exp_node *left;
    exp_node *right;

  // the constructor for node links the node to its children,
  // and stores the character representation of the operator.
    operator_node(exp_node *L, exp_node *R);
};

class number_node : public exp_node {
  
public:
  number_node(int value);
  void print();
  int evaluate();
};

class unary_minus_node : public exp_node {
 protected:
  exp_node *exp;
 public:
  unary_minus_node(exp_node *exp);
  void print();
  int evaluate();
};

class id_node : public exp_node {
protected:
  string id;

public:
  id_node(string value);
  void print();
  int evaluate();
};

// add_node inherits the characteristics of node and adds its own evaluate function
class add_node : public operator_node {
  public:

  // add_node's constructor just uses node's constructor
  add_node(exp_node *L, exp_node *R);
  void print();
  int evaluate();
};


// subtract_node inherits the characteristics of node and adds its own evaluate function
class subtract_node : public operator_node {
  public:

  subtract_node(exp_node *L, exp_node *R);
  void print();
  int evaluate();
};


// times_node inherits the characteristics of node and adds its own evaluate function
class multiply_node : public operator_node {
  public:

  multiply_node(exp_node *L, exp_node *R);
  void print();
  int evaluate();
};


// divide_node inherits the characteristics of node and adds its own evaluate function
class divide_node : public operator_node {
  public:

  divide_node(exp_node *L, exp_node *R);
  void print();
  int evaluate();
};


// modulo_node inherits the characteristics of node and adds its own evaluate function
class modulo_node : public operator_node {
  public:

  modulo_node(exp_node *L, exp_node *R);
  void print();
  int evaluate();
};


class statement {
 public:
  virtual void print() {}
  virtual void evaluate() = 0;
};

class assignment_stmt : public statement {
 protected:
  string id;
  exp_node *exp;
 public:
  assignment_stmt(string name, exp_node *expression);
  void print();
  void evaluate();
};

class print_stmt: public statement {
 protected:
  string id;
 public:
  print_stmt(string id);
  void evaluate();
};

class pgm {
 protected:
  list<statement *> *stmts;
 public:
  pgm(list<statement *> *stmtlist);
  void evaluate();
};

// the object at the base of our tree
extern map<string, int> idTable;
extern pgm *root;
