import 'package:flutter/material.dart';
import 'package:flutter_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:flutter_tracker/widgets/new_expense.dart';
import '../models/expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _reqisteredExpenses = [
    Expense(
      title: 'Flutte Course',
      amount: 23,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: 'New Coat',
      amount: 35,
      date: DateTime.now(),
      category: Category.leisure,
    ),
    Expense(
      title: 'New Coat',
      amount: 35,
      date: DateTime.now(),
      category: Category.leisure,
    ),
    Expense(
      title: 'New Coat',
      amount: 35,
      date: DateTime.now(),
      category: Category.leisure,
    ),
  ];

  void _openAddExpensesOverlay() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (ctx) => NewExpense(onAddExpense: _addExpense));
  }

  void _addExpense(Expense expense) {
    setState(() {
      _reqisteredExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    setState(() {
      _reqisteredExpenses.remove(expense);
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(
      child: Text('No expenses found.Start adding some!'),
    );

    if (_reqisteredExpenses.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: _reqisteredExpenses,
        onRemoveExpense: _removeExpense,
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Expenses Tracker'),
        actions: [
          IconButton(
            onPressed: _openAddExpensesOverlay,
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: Column(
        children: [
          const Text('The Chart'),
          Expanded(
            child: mainContent,
          ),
        ],
      ),
    );
  }
}
